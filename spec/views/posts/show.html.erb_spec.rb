require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/posts/show.html.erb" do
  include PostsHelper
  
  before(:each) do
    assigns[:post] = @post = stub_model(Post,
      :text => "value for text",
    )
  end

  it "should render attributes in <p>" do
    render "/posts/show.html.erb"
    response.should have_text(/value\ for\ text/)
  end
end

