require File.expand_path("../../spec_helper.rb", __FILE__)

describe ForumsController do
  describe "GET index" do
    it "returns all forums" do
      @forums = [ mock_model(Forum) ]
      Forum.stub(:all) { @forum }

      get :index

      assigns(:forums).should eq( @forum )
      response.should render_template("index")
    end
  end

  describe "GET show" do
    it "redirect to forum_forums" do
      @forum = mock_model(Forum)
      Forum.should_receive(:find).with(3).and_return(@forum)

      get :show, :id => 3

      response.should redirect_to(forum_posts_path(@forum))
    end
  end

  pending "GET new"

  pending "POST create"

  pending "GET edit"

  pending "PUT update"

  pending "DELETE destroy"
end

