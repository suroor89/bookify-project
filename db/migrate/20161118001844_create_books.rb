class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.text :description
      t.string :amazon_id
      t.integer :rating
      t.text :keywords
      t.references :user

      t.timestamps
    end
  end
end
