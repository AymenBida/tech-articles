class User < ApplicationRecord
  has_many :articles
  has_many :votes
  has_many :articles, through: :votes
  validates :name, presence: true, length: { in: 2..20 }
end
