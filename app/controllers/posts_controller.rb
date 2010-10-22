class PostsController < ApplicationController
  before_filter :find_forum
  before_filter :find_post,  :except => [:index, :new, :create]

  def new
    @post = @forum.posts.build
  end

  protected
  def find_forum
    @forum = Forum.find(params[:forum_id])
  end

  def find_post
    @post = @forum.posts.find(params[:id])
  end
end
