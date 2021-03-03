class User < ApplicationRecord
  validates :name, presence: true, length: { in: 2..20 }

  has_many :articles
  has_many :votes
  has_many :articles, through: :votes
end
