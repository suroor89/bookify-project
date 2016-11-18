class RemoveRatingFromBooks < ActiveRecord::Migration[5.0]
  def change
    remove_column :books, :rating
  end
end
