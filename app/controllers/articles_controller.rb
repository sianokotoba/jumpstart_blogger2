class ArticlesController < ApplicationController
  params = ActionController::Parameters.new({
    id: Article.all
  })
  
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end


end
