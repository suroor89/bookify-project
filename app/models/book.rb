class Book < ApplicationRecord
  belongs_to :user
  # has_many :genre_books, dependent: :destroy
  # has_many :genres, through: :genre_books

  before_save :set_keywords

  default_scope ->() { order(created_at: :desc)}

  scope :search, ->(keyword) {
    where(["keywords LIKE :keyword", keyword: "%#{keyword.downcase}%"]) if keyword.present?
  }

  scope :filter, ->(genre_name) {
    # Genre.find_by(name: genre_name).books if genre_name.present?
    joins(:genres).where('genres.name = ?', genre_name) if genre_name.present?
  }

  private
  def set_keywords
    self.keywords = [title, description, author].map(&:downcase).join(" ")
  end
end
