class VotesController < ApplicationController
  def create
    @article = Article.includes(:categories).find(params[:article_id])
    @vote = @article.votes.build(user_id: current_user.id)
    if @vote.save
      redirect_to articles_path(cat: @article.categories.first.id),
                  notice: "You liked \"#{@article.title}\""
    else
      redirect_to articles_path(cat: @article.categories.first.id),
                  alert: 'You cannot like this article'
    end
  end

  def destroy
    @article = Article.includes(:categories).find(params[:article_id])
    @vote = Vote.where(article_id: @article.id, user_id: current_user.id)
    if @vote
      @vote.destroy_all
      redirect_to articles_path(cat: Article.find(params[:article_id]).categories.first.id),
                  notice: "You disliked \"#{@article.title}\"!"
    else
      redirect_to articles_path(cat: Article.find(params[:article_id]).categories.first.id),
                  alert: 'Something weird happened!'
    end
  end
end
