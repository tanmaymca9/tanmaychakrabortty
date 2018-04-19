class CreateAppliedTeachers < ActiveRecord::Migration[5.1]
  def change
    create_table :applied_teachers do |t|
      t.string :name
      t.string :email
      t.string :phone_no
      t.text :description
      t.integer :teacher_id
      t.integer :user_id
      t.string :user_role

      t.timestamps
    end
  end
end
