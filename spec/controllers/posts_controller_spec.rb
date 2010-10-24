require File.expand_path("../../spec_helper.rb", __FILE__)

describe PostsController do

  describe "GET index" do
    it "returns all posts" do
      @forum = mock_model(Forum)
      @posts = [mock_model(Post)]
      controller.should_receive(:find_forum) { controller.instance_variable_set("@forum", @forum) }
      @forum.should_receive(:posts).and_return(@posts)

      get :index, :forum_id => 3

      assigns(:forum).should eq( @forum )
      assigns(:posts).should eq( @posts )
      response.should render_template("index")
    end
  end

  pending "GET show"

  pending "GET new"

  pending "POST create"

  pending "GET edit"

  pending "PUT update"

  pending "DELETE destroy"
end

