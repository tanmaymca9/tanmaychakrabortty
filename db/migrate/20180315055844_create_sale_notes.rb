class CreateSaleNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :sale_notes do |t|
      t.string :title
      t.text :description
      t.boolean :sale, default: true

      t.timestamps
    end
  end
end
