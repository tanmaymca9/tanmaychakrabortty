class CreateTeacherRequires < ActiveRecord::Migration[5.1]
  def change
    create_table :teacher_requires do |t|
      t.string :name
      t.string :qualification
      t.string :subject
      t.string :level
      t.string :new_level
      t.string :experience
      t.string :annual_salary
      t.boolean :job_type
      t.integer :user_id

      t.timestamps
    end
  end
end
