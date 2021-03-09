class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :article

  scope :group_by_articles, -> { select(:article_id).group(:article_id).order(article_id: :desc).count }
end
