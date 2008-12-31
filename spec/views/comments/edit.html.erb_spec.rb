require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/comments/edit.html.erb" do
  include CommentsHelper
  
  before(:each) do
    assigns[:comment] = @comment = stub_model(Comment,
      :new_record? => false,
      :commentable_type => "value for commentable_type",
      :commentable => ,
      :content => "value for content",
      :author => "value for author"
    )
  end

  it "should render edit form" do
    render "/comments/edit.html.erb"
    
    response.should have_tag("form[action=#{comment_path(@comment)}][method=post]") do
      with_tag('input#comment_commentable_type[name=?]', "comment[commentable_type]")
      with_tag('input#comment_commentable[name=?]', "comment[commentable]")
      with_tag('textarea#comment_content[name=?]', "comment[content]")
      with_tag('input#comment_author[name=?]', "comment[author]")
    end
  end
end


