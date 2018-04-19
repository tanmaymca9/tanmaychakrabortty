class AddIdToSaleNotes < ActiveRecord::Migration[5.1]
  def change
    add_column :sale_notes, :user_id, :integer
  end
end
