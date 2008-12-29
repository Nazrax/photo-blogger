require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/pictures/show.html.erb" do
  include PicturesHelper
  
  before(:each) do
    assigns[:picture] = @picture = stub_model(Picture,
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

  it "should render attributes in <p>" do
    render "/pictures/show.html.erb"
    response.should have_text(//)
    response.should have_text(/value\ for\ content_type/)
    response.should have_text(/value\ for\ filename/)
    response.should have_text(/value\ for\ thumbnail/)
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(//)
  end
end

