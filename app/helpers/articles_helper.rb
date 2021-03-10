module ArticlesHelper
  def check_owner(article)
    article.author_id == current_user.id
  end

  def show_edit(article)
    link_to fa_icon('edit'), edit_article_path(article), class: 'article__edit' if check_owner(article)
  end
end
