class PostsController < ApplicationController
  before_filter :find_forum
  before_filter :find_post,  :except => [:index, :new, :create]

  def show
  end

  def new
    @post = @forum.posts.build
  end

  def create
    @post = @forum.posts.build(params[:post])
    if @post.save
      redirect_to forum_post_path(@forum, @post)
    else
      render :new
    end
  end

  protected
  def find_forum
    @forum = Forum.find(params[:forum_id])
  end

  def find_post
    @post = @forum.posts.find(params[:id])
  end
end
