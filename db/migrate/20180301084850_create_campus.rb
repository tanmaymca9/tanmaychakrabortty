class CreateCampus < ActiveRecord::Migration[5.1]
  def change
    create_table :campus do |t|
      t.string :title
      t.text :description
      t.string :user_id

      t.timestamps
    end
  end
end
