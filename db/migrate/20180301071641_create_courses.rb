class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :course_name
      t.string :course_duration
      t.boolean :course_type
      t.string :course_fee
      t.string :course_affliation
      t.text :course_description
      t.integer :user_id

      t.timestamps
    end
  end
end
