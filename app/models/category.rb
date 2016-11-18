class Category < ApplicationRecord
  has_many :category_books, dependent: :destroy
  has_many :books, through: :category_books

  scope :categories_from_user, ->(user) { joins(:books).where('books.id in (?)', user.book_ids) }
end
