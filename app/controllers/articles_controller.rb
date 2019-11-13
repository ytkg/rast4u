class ArticlesController < ApplicationController
  def index
    @articles = Article.order(id: :desc)
    render json: @articles
  end
end
