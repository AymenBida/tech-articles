class Article < ApplicationRecord
  validates :title, presence: true, length: { in: 2..100 }
  validates :text, presence: true, length: { in: 2..1000 }

  belongs_to :author, class_name: 'User'
  has_many :votes
  has_and_belongs_to_many :categories
end
