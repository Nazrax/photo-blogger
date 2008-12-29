require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Picture do
  before(:each) do
    @valid_attributes = {
      :parent => ,
      :content_type => "value for content_type",
      :filename => "value for filename",
      :thumbnail => "value for thumbnail",
      :size => "1",
      :width => "1",
      :height => "1",
      :post => 
    }
  end

  it "should create a new instance given valid attributes" do
    Picture.create!(@valid_attributes)
  end
end
