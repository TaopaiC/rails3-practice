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

  describe "GET new" do
    it "returns a new forum form" do
      @forum = mock_model(Forum)
      Forum.should_receive(:new).and_return(@forum)

      get :new

      assigns(:forum).should eq(@forum)
      response.should render_template("new")
    end
  end

  describe "POST create" do
    it "creates successfully" do
      @forum = mock_model(Forum)
      @params = { "title" => Faker::Lorem.sentence }
      Forum.should_receive(:new).with(@params).and_return(@forum)
      @forum.should_receive(:save).and_return(true)

      post :create, {:forum => @params}

      response.should redirect_to(forum_posts_path(@forum))
    end

    it "fails to create" do
      @forum = mock_model(Forum)
      @params = { "title" => Faker::Lorem.sentence }
      Forum.should_receive(:new).with(@params).and_return(@forum)
      @forum.should_receive(:save).and_return(false)

      post :create, {:forum => @params}

      assigns(:forum).should eq(@forum)
      response.should render_template("new")
    end
  end

  describe "GET edit" do
    it "returns requested forum" do
      @forum = mock_model(Forum)
      Forum.should_receive(:find).with(3).and_return(@forum)

      get :edit, :id => 3

      assigns(:forum).should eq(@forum)
      response.should render_template("edit")
    end
  end

  describe "PUT update" do
    it "update successfully with valid params" do
      @forum = mock_model(Forum)
      @params = { "title" => Faker::Lorem.sentence }
      Forum.should_receive(:find).with(3).and_return(@forum)
      @forum.should_receive(:update_attributes).with(@params).and_return(true)

      put :update, {:id => 3, :forum => @params}

      response.should redirect_to(forum_posts_path(@forum))
    end

    it "fails to update with invalid params" do
      @forum = mock_model(Forum)
      @params = { "title" => Faker::Lorem.sentence }
      Forum.should_receive(:find).with(3).and_return(@forum)
      @forum.should_receive(:update_attributes).with(@params).and_return(false)

      put :update, {:id => 3, :forum => @params}

      assigns(:forum).should eq(@forum)
      response.should render_template("edit")
    end
  end

  pending "DELETE destroy"
end

