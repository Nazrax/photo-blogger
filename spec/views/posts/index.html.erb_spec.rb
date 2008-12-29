require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/posts/index.html.erb" do
  include PostsHelper
  
  before(:each) do
    assigns[:posts] = [
      stub_model(Post,
        :text => "value for text",
      ),
      stub_model(Post,
        :text => "value for text",
      )
    ]
  end

  it "should render list of posts" do
    render "/posts/index.html.erb"
    response.should have_tag("tr>td", "value for text", 2)
  end
end

