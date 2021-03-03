class Article < ApplicationRecord
  validates :title, presence: true, length: { in: 2..100 }
  validates :text, presence: true, length: { in: 2..1000 }

  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :votes
  has_many :users, through: :votes
  has_and_belongs_to_many :categories
end