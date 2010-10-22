class ForumsController < ApplicationController
  before_filter :find_forum, :except => [:index, :new, :create]

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

  protected
  def find_forum
    @forum = Forum.find(params[:id])
  end
end
