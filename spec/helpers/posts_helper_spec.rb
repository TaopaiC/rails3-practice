require File.expand_path("../../spec_helper.rb", __FILE__)

describe PostsHelper do
  describe "menu" do
    before :each do
      @forum = mock_model(Forum)
      assigns[:forum] = @forum
    end

    describe "#new_post_menu" do
      it "display the new_post menu" do
        menu = helper.new_post_menu

        menu.should =~ /#{forum_posts_path(@forum)}/
      end
    end

    describe "#post_menu" do
      it "display the post menu" do
        @post = mock_model(Post)
        assigns[:post] = @post
        menu = helper.post_menu

        menu.should =~ /#{forum_posts_path(@forum)}/
        menu.should =~ /#{edit_forum_post_path(@forum, @post)}/
        menu.should =~ /#{forum_post_path(@forum, @post)}/
      end
    end

    describe "#posts_menu" do
      it "display the posts menu" do
        menu = helper.posts_menu

        menu.should =~ /#{new_forum_post_path(@forum)}/
      end
    end
  end
end
