class AddRoleToAppliedSchools < ActiveRecord::Migration[5.1]
  def change
    add_column :applied_schools, :role, :string
  end
end
