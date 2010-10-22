require File.expand_path("../../spec_helper.rb", __FILE__)

describe ForumsController do

  describe "route generation" do
    it "should be correct routing for forums" do
      { :get    => "/forums"       }.should route_to(:controller => "forums", :action => "index")
      { :get    => "/forums/new"   }.should route_to(:controller => "forums", :action => "new")
      { :post   => "/forums"       }.should route_to(:controller => "forums", :action => "create")    
      { :get    => "/forums/1"     }.should route_to(:controller => "forums", :action => "show",    :id => "1")    
      { :get    => "/forums/1/edit"}.should route_to(:controller => "forums", :action => "edit",    :id => "1")
      { :put    => "/forums/1"     }.should route_to(:controller => "forums", :action => "update",  :id => "1")    
      { :delete => "/forums/1"     }.should route_to(:controller => "forums", :action => "destroy", :id => "1")    
    end
  end
end
