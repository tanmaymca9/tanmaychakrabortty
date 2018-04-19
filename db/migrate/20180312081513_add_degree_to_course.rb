class AddDegreeToCourse < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :degree_name, :string
  end
end
