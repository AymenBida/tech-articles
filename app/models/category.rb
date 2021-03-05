class Category < ApplicationRecord
  validates :name, presence: true

  has_and_belongs_to_many :articles

  def last_article
    articles.last
  end
end
