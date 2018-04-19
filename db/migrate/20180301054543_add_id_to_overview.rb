class AddIdToOverview < ActiveRecord::Migration[5.1]
  def change
    add_column :overviews, :user_id, :integer
    add_column :overviews, :user_type, :string
  end
end
