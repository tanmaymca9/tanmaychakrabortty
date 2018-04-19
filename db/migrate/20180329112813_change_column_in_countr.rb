class ChangeColumnInCountr < ActiveRecord::Migration[5.1]
  def change
  	rename_column :stats, :country_id, :countr_id
  	rename_column :cities, :state_id, :stat_id
  end
end
