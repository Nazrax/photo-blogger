require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/comments/new.html.erb" do
  include CommentsHelper
  
  before(:each) do
    assigns[:comment] = stub_model(Comment,
      :new_record? => true,
      :commentable_type => "value for commentable_type",
      :commentable => ,
      :content => "value for content",
      :author => "value for author"
    )
  end

  it "should render new form" do
    render "/comments/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", comments_path) do
      with_tag("input#comment_commentable_type[name=?]", "comment[commentable_type]")
      with_tag("input#comment_commentable[name=?]", "comment[commentable]")
      with_tag("textarea#comment_content[name=?]", "comment[content]")
      with_tag("input#comment_author[name=?]", "comment[author]")
    end
  end
end


