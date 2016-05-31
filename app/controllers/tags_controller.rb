class TagsController < ApplicationController
  before_filter :require_login, only: [:destroy]

  def require_login
    unless current_user #logged_in
      redirect_to root_path
      flash.notice = "You must be logged in to do this!"
    end
  end

  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def destroy
    @tag = Tag.find(params[:id]).destroy

    flash.notice = "Tag '#{@tag.name}' Deleted!"

    redirect_to tags_path
  end
end
