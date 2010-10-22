class ForumsController < ApplicationController
  before_filter :find_forum, :except => [:index, :new, :create]

  protected
  def find_forum
    @forum = Forum.find(params[:id])
  end
end
