class AddNewDegreeToCourses < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :new_degree_name, :string
    add_column :courses, :new_course_name, :string
  end
end
