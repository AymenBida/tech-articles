# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

CATEGORIES = ['Web development', 'Network', 'Artificial Intelligence', 'Internet Of Things', 'Startup',
              'Gaming', 'Hardware', 'Other'].freeze

CATEGORIES.each { |cat| Category.create(name: cat, priority: 0) }

user = User.create(name: 'Example User')
Category.all.each do |cat|
  article = user.articles.create(title: 'Example Title', text: 'Example Text')
  article.categories << cat
  cat.priority += 1
  cat.save
end
