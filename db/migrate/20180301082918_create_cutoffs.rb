class CreateCutoffs < ActiveRecord::Migration[5.1]
  def change
    create_table :cutoffs do |t|
      t.string :name
      t.string :category
      t.string :rank
      t.string :examination
      t.string :percentage
      t.integer :user_id

      t.timestamps
    end
  end
end
