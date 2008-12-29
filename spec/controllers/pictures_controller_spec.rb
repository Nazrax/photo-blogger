require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PicturesController do

  def mock_picture(stubs={})
    @mock_picture ||= mock_model(Picture, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all pictures as @pictures" do
      Picture.should_receive(:find).with(:all).and_return([mock_picture])
      get :index
      assigns[:pictures].should == [mock_picture]
    end

    describe "with mime type of xml" do
  
      it "should render all pictures as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Picture.should_receive(:find).with(:all).and_return(pictures = mock("Array of Pictures"))
        pictures.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested picture as @picture" do
      Picture.should_receive(:find).with("37").and_return(mock_picture)
      get :show, :id => "37"
      assigns[:picture].should equal(mock_picture)
    end
    
    describe "with mime type of xml" do

      it "should render the requested picture as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Picture.should_receive(:find).with("37").and_return(mock_picture)
        mock_picture.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new picture as @picture" do
      Picture.should_receive(:new).and_return(mock_picture)
      get :new
      assigns[:picture].should equal(mock_picture)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested picture as @picture" do
      Picture.should_receive(:find).with("37").and_return(mock_picture)
      get :edit, :id => "37"
      assigns[:picture].should equal(mock_picture)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created picture as @picture" do
        Picture.should_receive(:new).with({'these' => 'params'}).and_return(mock_picture(:save => true))
        post :create, :picture => {:these => 'params'}
        assigns(:picture).should equal(mock_picture)
      end

      it "should redirect to the created picture" do
        Picture.stub!(:new).and_return(mock_picture(:save => true))
        post :create, :picture => {}
        response.should redirect_to(picture_url(mock_picture))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved picture as @picture" do
        Picture.stub!(:new).with({'these' => 'params'}).and_return(mock_picture(:save => false))
        post :create, :picture => {:these => 'params'}
        assigns(:picture).should equal(mock_picture)
      end

      it "should re-render the 'new' template" do
        Picture.stub!(:new).and_return(mock_picture(:save => false))
        post :create, :picture => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested picture" do
        Picture.should_receive(:find).with("37").and_return(mock_picture)
        mock_picture.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :picture => {:these => 'params'}
      end

      it "should expose the requested picture as @picture" do
        Picture.stub!(:find).and_return(mock_picture(:update_attributes => true))
        put :update, :id => "1"
        assigns(:picture).should equal(mock_picture)
      end

      it "should redirect to the picture" do
        Picture.stub!(:find).and_return(mock_picture(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(picture_url(mock_picture))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested picture" do
        Picture.should_receive(:find).with("37").and_return(mock_picture)
        mock_picture.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :picture => {:these => 'params'}
      end

      it "should expose the picture as @picture" do
        Picture.stub!(:find).and_return(mock_picture(:update_attributes => false))
        put :update, :id => "1"
        assigns(:picture).should equal(mock_picture)
      end

      it "should re-render the 'edit' template" do
        Picture.stub!(:find).and_return(mock_picture(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested picture" do
      Picture.should_receive(:find).with("37").and_return(mock_picture)
      mock_picture.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the pictures list" do
      Picture.stub!(:find).and_return(mock_picture(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(pictures_url)
    end

  end

end
