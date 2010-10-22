class ForumsController < ApplicationController
  before_filter :find_forum, :except => [:index, :new, :create]

  def new
    @forum = Forum.new
  end

  protected
  def find_forum
    @forum = Forum.find(params[:id])
  end
end
