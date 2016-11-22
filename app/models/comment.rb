class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates_presence_of :content, :user_id, :book_id
end
