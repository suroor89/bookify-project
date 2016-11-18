class CreateCategoryBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :category_books do |t|
      t.references :category, foreign_key: true, index: true
      t.references :book, foreign_key: true, index: true

      t.timestamps
    end
  end
end
