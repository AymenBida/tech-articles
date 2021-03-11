class ArticlesController < ApplicationController
  before_action :authenticate_user
  skip_before_action :authenticate_user, only: %i[index new create]

  def index
    @category = Category.find(params[:cat])
    @articles = @category.articles.order_by_most_recent.includes(:author)
    @category.priority += 1
    @category.save
  end

  def new
    @article = current_user.articles.build
    @categories = Category.all
  end

  def create
    @article = current_user.articles.build(article_params)
    @categories = Category.where(id: article_category_params[:category_id])
    if @categories.empty?
      flash.now.alert = 'You have to choose at least one category!'
      @categories = Category.all
      render :new
    elsif @article.save
      @categories.each { |cat| @article.categories << cat }
      redirect_to categories_path, notice: 'You successfully created an article'
    else
      @article.valid?
      flash.now.alert = "Sorry! #{@article.errors.full_messages.first}!"
      @categories = Category.all
      render :new
    end
  end

  def edit
    set_article
    @categories = Category.where.not(id: @article.categories)
  end

  def update
    set_article
    @categories = Category.where(id: article_category_params[:category_id])
    if @article.update(article_params)
      @categories.each { |cat| @article.categories << cat } unless @categories.empty?
      redirect_to categories_path, notice: 'You successfully edited your article'
    else
      @article.valid?
      flash.now.alert = "Sorry! #{@article.errors.full_messages.first}!"
      @categories = Category.where.not(id: @article.categories)
      render :edit
    end
  end

  private

  def authenticate_user
    return unless set_article.author.id != current_user.id

    redirect_to categories_path, alert: "You can't modify other users articles"
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :text, :image)
  end

  def article_category_params
    params.require(:articles_categories).permit(category_id: [])
  end
end
