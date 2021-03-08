class ArticlesController < ApplicationController
  def index
    @category = Category.find(params[:cat])
    @articles = @category.articles.order_by_most_recent
  end

  def new
    @article = current_user.articles.build
    @categories = Category.all.pluck(:name, :id)
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      @category = @article.categories << Category.find_by(id: article_category_params[:category_id])
      redirect_to categories_path, notice: 'You successfully created an article'
    else
      flash.now.alert = 'Oops, something went wrong !'
      render :new
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :text, :image)
  end

  def article_category_params
    params.require(:articles_categories).permit(:category_id)
  end
end
