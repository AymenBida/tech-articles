class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { in: 2..20 }

  has_many :articles, foreign_key: 'author_id'
  has_many :votes
end
