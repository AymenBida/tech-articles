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
      @category = Category.find_by(id: article_category_params[:category_id])
      @category.priority += 1
      @category.save
      @article.categories << @category
      redirect_to categories_path, notice: 'You successfully created an article'
    else
      flash.now.alert = 'Oops, something went wrong !'
      render :new
    end
  end

  def edit
    set_article
    @categories = Category.all.pluck(:name, :id)
    @category = @article.categories.first
  end

  def update
    set_article
    @category = @article.categories.take
    @categories = Category.all.pluck(:name, :id)
    if @article.update(article_params)
      unless @category.id == article_category_params[:category_id].to_i
        @category.priority -= 1
        @category.save
        @article.categories.destroy_all
        @new_category = Category.find_by(id: article_category_params[:category_id])
        @article.categories << @new_category
        @new_category.priority += 1
        @new_category.save
      end
      redirect_to categories_path, notice: 'You successfully edited your article'
    else
      @article.valid?
      flash.now.alert = "Sorry! #{@article.errors.full_messages.first}!"
      render :edit
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :text, :image)
  end

  def article_category_params
    params.require(:articles_categories).permit(:category_id)
  end
end
