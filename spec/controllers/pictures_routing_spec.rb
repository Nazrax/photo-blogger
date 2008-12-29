require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PicturesController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "pictures", :action => "index").should == "/pictures"
    end
  
    it "should map #new" do
      route_for(:controller => "pictures", :action => "new").should == "/pictures/new"
    end
  
    it "should map #show" do
      route_for(:controller => "pictures", :action => "show", :id => 1).should == "/pictures/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "pictures", :action => "edit", :id => 1).should == "/pictures/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "pictures", :action => "update", :id => 1).should == "/pictures/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "pictures", :action => "destroy", :id => 1).should == "/pictures/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/pictures").should == {:controller => "pictures", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/pictures/new").should == {:controller => "pictures", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/pictures").should == {:controller => "pictures", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/pictures/1").should == {:controller => "pictures", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/pictures/1/edit").should == {:controller => "pictures", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/pictures/1").should == {:controller => "pictures", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/pictures/1").should == {:controller => "pictures", :action => "destroy", :id => "1"}
    end
  end
end
