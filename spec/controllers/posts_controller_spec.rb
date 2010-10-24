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

  describe "GET show" do
    it "returns requested post" do
      @forum = mock_model(Forum)
      @post  = mock_model(Post)
      controller.should_receive(:find_forum) { controller.instance_variable_set("@forum", @forum) }
      controller.should_receive(:find_post ) { controller.instance_variable_set("@post",  @post)  }

      get :show, :forum_id => 4, :id => 3

      assigns(:forum).should eq( @forum )
      assigns(:post ).should eq( @post  )
      response.should render_template("show")
    end
  end

  pending "GET new"

  pending "POST create"

  pending "GET edit"

  pending "PUT update"

  pending "DELETE destroy"
end

