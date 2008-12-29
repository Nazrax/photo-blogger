require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/pictures/new.html.erb" do
  include PicturesHelper
  
  before(:each) do
    assigns[:picture] = stub_model(Picture,
      :new_record? => true,
      :parent => ,
      :content_type => "value for content_type",
      :filename => "value for filename",
      :thumbnail => "value for thumbnail",
      :size => "1",
      :width => "1",
      :height => "1",
      :post => 
    )
  end

  it "should render new form" do
    render "/pictures/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", pictures_path) do
      with_tag("input#picture_parent[name=?]", "picture[parent]")
      with_tag("input#picture_content_type[name=?]", "picture[content_type]")
      with_tag("input#picture_filename[name=?]", "picture[filename]")
      with_tag("input#picture_thumbnail[name=?]", "picture[thumbnail]")
      with_tag("input#picture_size[name=?]", "picture[size]")
      with_tag("input#picture_width[name=?]", "picture[width]")
      with_tag("input#picture_height[name=?]", "picture[height]")
      with_tag("input#picture_post[name=?]", "picture[post]")
    end
  end
end


