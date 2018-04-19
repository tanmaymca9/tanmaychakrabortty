class CreateCountrs < ActiveRecord::Migration[5.1]
  def change
    create_table :countrs do |t|
      t.string :name

      t.timestamps
    end
  end
end
