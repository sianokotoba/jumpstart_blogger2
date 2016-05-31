class CommentsController < ApplicationController
  before_filter :require_login, except: [:create]

  def require_login
    unless current_user #logged_in
      redirect_to root_path
      flash.notice = "You must be logged in to do this!"
    end
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.article_id = params[:article_id]

    @comment.save

    redirect_to article_path(@comment.article)
  end

  def comment_params
    params.require(:comment).permit(:author_name, :body)
  end
end
