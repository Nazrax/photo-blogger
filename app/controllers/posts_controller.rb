class PostsController < ApplicationController
  # GET /posts
  # GET /posts.xml
  def index
    @posts = Post.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.xml
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.xml
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.xml
  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        flash[:notice] = 'Post was successfully created.'
        format.html { redirect_to(@post) }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    @post = Post.find(params[:id])
    params[:post][:picture_id] = nil if params[:post][:picture_id].to_i == 0

    respond_to do |format|
      if @post.update_attributes(params[:post])
        process_file_uploads
        flash[:notice] = 'Post was successfully updated.'
        format.html { redirect_to(@post) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.xml  { head :ok }
    end
  end

  protected

  def process_file_uploads
    if params[:picture]
      params[:picture].each do |picture_id, values|
        picture = Picture.find(picture_id)
        if values['delete'] == '1'
          picture.destroy
        else
          if picture.caption != values[:caption]
            picture.update_attribute :caption, values[:caption]
          end
          if picture.position != values[:position]
            picture.update_attribute :position, values[:position]
          end
        end
      end
    end

    if params[:newpicture]
      params[:newpicture].each do |values|
        if values[:uploaded_data] != ''  # new picture
          @post.pictures.create(:caption => values[:caption], :uploaded_data => values[:uploaded_data], :position => values[:position])
        end
      end
    end

    1.upto(@post.pictures.size) do |i|
      picture = @post.pictures[i-1]
      position = i * 10
      picture.update_attribute(:position, position) if picture.position != position
    end
  end
end
