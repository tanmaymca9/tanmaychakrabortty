class CreateSellBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :sell_books do |t|
      t.string :title
      t.text :description
      t.string :price
      t.integer :user_id

      t.timestamps
    end
  end
end
