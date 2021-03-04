class ArticlesController < ApplicationController
  def new
    @article = current_user.articles.build
    @categories = Category.all.pluck(:name, :id)
  end

  def create
    @article = User.first.articles.build(article_params)
    # @article = current_user.articles.build(author_id: current_user.id, article_params)
    @article.valid?
    p @article.errors.full_messages
    if @article.save
      puts 'dmldkdmlkzmdlkzmdlk------------------------'
      @category = @article.categories << Category.find_by(id: article_category_params)
    end
  end

  private

  def article_params
    params.require(:article).permit(:author_id, :title, :text, :image)
  end

  def article_category_params
    params.require(:articles_categories).permit(:category_id)
  end
end
