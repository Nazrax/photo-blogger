require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/comments/index.html.erb" do
  include CommentsHelper
  
  before(:each) do
    assigns[:comments] = [
      stub_model(Comment,
        :commentable_type => "value for commentable_type",
        :commentable => ,
        :content => "value for content",
        :author => "value for author"
      ),
      stub_model(Comment,
        :commentable_type => "value for commentable_type",
        :commentable => ,
        :content => "value for content",
        :author => "value for author"
      )
    ]
  end

  it "should render list of comments" do
    render "/comments/index.html.erb"
    response.should have_tag("tr>td", "value for commentable_type", 2)
    response.should have_tag("tr>td", , 2)
    response.should have_tag("tr>td", "value for content", 2)
    response.should have_tag("tr>td", "value for author", 2)
  end
end

