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

  describe "GET new" do
    it "returns a new post form" do
      @forum = mock_model(Forum)
      @post  = mock_model(Post)
      @posts = []
      controller.should_receive(:find_forum) { controller.instance_variable_set("@forum", @forum) }
      @forum.should_receive(:posts).and_return(@posts)
      @posts.should_receive(:build).and_return(@post)

      get :new, :forum_id => 4

      assigns(:forum).should eq(@forum)
      assigns(:post ).should eq(@post)
      response.should render_template("new")
    end
  end

  describe "POST create" do
    before :each do
      @forum = mock_model(Forum)
      @post  = mock_model(Post)
      @posts = []
      @params = { "title" => Faker::Lorem.sentence }

      controller.should_receive(:find_forum) { controller.instance_variable_set("@forum", @forum) }
      @forum.stub!(:posts).and_return(@posts)
      @posts.should_receive(:build).with(@params).and_return(@post)
    end

    it "creates successfully" do
      @post.should_receive(:save).and_return(true)

      post :create, {:forum_id => 4, :post => @params}

      response.should redirect_to(forum_post_path(@forum, @post))
    end

    it "fails to create" do
      @post.should_receive(:save).and_return(false)

      post :create, {:forum_id => 4, :post => @params}

      assigns(:forum).should eq(@forum)
      assigns(:post ).should eq(@post)
      response.should render_template("new")
    end
  end

  pending "GET edit"

  pending "PUT update"

  pending "DELETE destroy"
end

