class Book < ApplicationRecord
  belongs_to :user
  has_many :category_books, dependent: :destroy
  has_many :categories, through: :category_books

  validates_presence_of :title, :author, :amazon_id, :description

  before_save :set_keywords

  default_scope ->() { order(created_at: :desc)}
  scope :by_category, ->(category_name) { joins(:categories).where('categories.name = ?', category_name) if category_name.present? }

  scope :search, ->(keyword) {
    where(["keywords LIKE :keyword", keyword: "%#{keyword.downcase}%"]) if keyword.present?
  }

  private
  def set_keywords
    self.keywords = [title, description, author].map(&:downcase).join(" ")
  end
end
