class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    best_article = Vote.group_by_articles.max_by { |_k, v| v }
    best_article_id = if best_article
                        best_article.first
                      else
                        Article.last.id
                      end
    @best_article = Article.find(best_article_id)
  end
end
