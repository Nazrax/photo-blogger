require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/pictures/index.html.erb" do
  include PicturesHelper
  
  before(:each) do
    assigns[:pictures] = [
      stub_model(Picture,
        :parent => ,
        :content_type => "value for content_type",
        :filename => "value for filename",
        :thumbnail => "value for thumbnail",
        :size => "1",
        :width => "1",
        :height => "1",
        :post => 
      ),
      stub_model(Picture,
        :parent => ,
        :content_type => "value for content_type",
        :filename => "value for filename",
        :thumbnail => "value for thumbnail",
        :size => "1",
        :width => "1",
        :height => "1",
        :post => 
      )
    ]
  end

  it "should render list of pictures" do
    render "/pictures/index.html.erb"
    response.should have_tag("tr>td", , 2)
    response.should have_tag("tr>td", "value for content_type", 2)
    response.should have_tag("tr>td", "value for filename", 2)
    response.should have_tag("tr>td", "value for thumbnail", 2)
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", , 2)
  end
end

