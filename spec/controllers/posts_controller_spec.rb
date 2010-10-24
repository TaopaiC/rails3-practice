require File.expand_path("../../spec_helper.rb", __FILE__)

describe PostsController do

  def should_find_forum
    @forum = mock_model(Forum)
    controller.should_receive(:find_forum) { controller.instance_variable_set("@forum", @forum) }
  end

  describe "before_filter" do
    it "find_forum returns requested forum" do
      @forum = mock_model(Forum)
      controller.params = {:forum_id => 4}

      Forum.should_receive(:find).with(4).and_return(@forum)
      controller.send(:find_forum)

      assigns(:forum).should eq(@forum)
    end

    it "find_post returns requested post" do
      @forum = mock_model(Forum)
      @post  = mock_model(Post)
      @posts = []
      controller.params = {:forum_id => 4, :id => 3}
      controller.instance_variable_set("@forum", @forum)
      @forum.should_receive(:posts).and_return(@posts)
      @posts.should_receive(:find).with(3).and_return(@post)

      controller.send(:find_post)

      assigns(:forum).should eq(@forum)
      assigns(:post ).should eq(@post)
    end
  end

  describe "GET index" do
    it "returns all posts" do
      should_find_forum
      @posts = [mock_model(Post)]
      @forum.should_receive(:posts).and_return(@posts)

      get :index, :forum_id => 3

      assigns(:forum).should eq( @forum )
      assigns(:posts).should eq( @posts )
      response.should render_template("index")
    end
  end

  describe "GET show" do
    it "returns requested post" do
      should_find_forum
      @post  = mock_model(Post)
      controller.should_receive(:find_post ) { controller.instance_variable_set("@post",  @post)  }

      get :show, :forum_id => 4, :id => 3

      assigns(:forum).should eq( @forum )
      assigns(:post ).should eq( @post  )
      response.should render_template("show")
    end
  end

  describe "GET new" do
    it "returns a new post form" do
      should_find_forum
      @post  = mock_model(Post)
      @posts = []
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
      should_find_forum
      @post  = mock_model(Post)
      @posts = []
      @params = { "title" => Faker::Lorem.sentence }

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

  describe "GET edit" do
    it "returns requested post" do
      should_find_forum
      @post  = mock_model(Post)
      controller.should_receive(:find_post ) { controller.instance_variable_set("@post",  @post)  }

      get :edit, :forum_id => 4, :id => 3

      assigns(:forum).should eq( @forum )
      assigns(:post ).should eq( @post  )
      response.should render_template("edit")
    end
  end

  describe "PUT update" do
    before :each do
      should_find_forum
      @post  = mock_model(Post)
      @params = { "title" => Faker::Lorem.sentence }

      controller.should_receive(:find_post ) { controller.instance_variable_set("@post",  @post)  }
    end

    it "update successfully with valid params" do
      @post.should_receive(:update_attributes).with(@params).and_return(true)

      get :update, {:forum_id => 4, :id => 3, :post => @params}

      response.should redirect_to(forum_post_path(@forum, @post))
    end

    it "fails to update with invalid params" do
      @post.should_receive(:update_attributes).with(@params).and_return(false)

      get :update, {:forum_id => 4, :id => 3, :post => @params}

      assigns(:forum).should eq(@forum)
      assigns(:post ).should eq(@post)
      response.should render_template("edit")
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested post" do
      should_find_forum
      @post  = mock_model(Post)

      controller.should_receive(:find_post ) { controller.instance_variable_set("@post",  @post)  }
      @post.should_receive(:destroy).and_return(true)

      delete :destroy, {:forum_id => 4, :id => 3}

      response.should redirect_to(forum_posts_path(@forum))
    end
  end
end

