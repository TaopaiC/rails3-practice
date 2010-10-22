require File.expand_path("../../spec_helper.rb", __FILE__)

describe PostsController do

  describe "route generation" do
    it "should be correct routing for posts" do
      { :get    => "/forums/1/posts"       }.should route_to(:forum_id => "1", :controller => "posts", :action => "index")
      { :get    => "/forums/1/posts/new"   }.should route_to(:forum_id => "1", :controller => "posts", :action => "new")
      { :post   => "/forums/1/posts"       }.should route_to(:forum_id => "1", :controller => "posts", :action => "create")    
      { :get    => "/forums/1/posts/1"     }.should route_to(:forum_id => "1", :controller => "posts", :action => "show",    :id => "1")    
      { :get    => "/forums/1/posts/1/edit"}.should route_to(:forum_id => "1", :controller => "posts", :action => "edit",    :id => "1")
      { :put    => "/forums/1/posts/1"     }.should route_to(:forum_id => "1", :controller => "posts", :action => "update",  :id => "1")    
      { :delete => "/forums/1/posts/1"     }.should route_to(:forum_id => "1", :controller => "posts", :action => "destroy", :id => "1")    
    end
  end
end
