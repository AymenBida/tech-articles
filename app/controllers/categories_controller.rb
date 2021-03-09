class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    best_article = Vote.group_by_articles.max_by{ |k, v| v }
    if best_article
      best_article_id = best_article.first
    else
      best_article_id = Article.last.id
    end
    @best_article = Article.find(best_article_id)
  end
end
