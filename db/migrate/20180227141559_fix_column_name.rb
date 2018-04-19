class FixColumnName < ActiveRecord::Migration[5.1]
  def change
  	rename_column :users, :class, :qualification
  end
end
