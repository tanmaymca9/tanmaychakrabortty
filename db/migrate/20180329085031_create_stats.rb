class CreateStats < ActiveRecord::Migration[5.1]
  def change
    create_table :stats do |t|
      t.string :name
      t.integer :country_id

      t.timestamps
    end
  end
end
