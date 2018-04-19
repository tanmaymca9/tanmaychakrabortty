class CreatePlacements < ActiveRecord::Migration[5.1]
  def change
    create_table :placements do |t|
      t.string :title
      t.text :description
      t.string :companies_visited
      t.string :students_placed
      t.string :total_students
      t.string :year
      t.integer :user_id

      t.timestamps
    end
  end
end
