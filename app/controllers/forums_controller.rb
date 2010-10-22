class ForumsController < ApplicationController
  before_filter :find_forum, :except => [:index, :new, :create]

  def index
    @forums = Forum.all
  end

  def show
  end

  def new
    @forum = Forum.new
  end

  def create
    @forum = Forum.new(params[:forum])
    if @forum.save
      redirect_to forum_path(@forum)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @forum.update_attributes(params[:forum])
      redirect_to forum_path(@forum)
    else
      render :edit
    end
  end

  def destroy
    @forum.destroy
    redirect_to forums_path
  end

  protected
  def find_forum
    @forum = Forum.find(params[:id])
  end
end
