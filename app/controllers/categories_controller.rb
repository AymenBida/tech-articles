class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    best_article_id = Vote.group_by_articles.max_by{ |k, v| v }.first
    @best_article = Article.find(best_article_id)
  end
end
