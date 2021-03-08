module VotesHelper
  def voted?(article)
    article.votes.where(user_id: current_user.id)
  end

  def show_vote(article)
    if voted?(article).empty?
      link_to fa_icon('heart'), article_votes_path(article.id), method: :post, class: 'article__like'
    else
      link_to fa_icon('heart'), article_vote_path(article.id, article.id), method: :delete, class: 'article__dislike'
    end
  end
end
