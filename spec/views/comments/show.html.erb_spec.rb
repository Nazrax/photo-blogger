require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/comments/show.html.erb" do
  include CommentsHelper
  
  before(:each) do
    assigns[:comment] = @comment = stub_model(Comment,
      :commentable_type => "value for commentable_type",
      :commentable => ,
      :content => "value for content",
      :author => "value for author"
    )
  end

  it "should render attributes in <p>" do
    render "/comments/show.html.erb"
    response.should have_text(/value\ for\ commentable_type/)
    response.should have_text(//)
    response.should have_text(/value\ for\ content/)
    response.should have_text(/value\ for\ author/)
  end
end

