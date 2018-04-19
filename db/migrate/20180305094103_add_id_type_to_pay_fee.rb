class AddIdTypeToPayFee < ActiveRecord::Migration[5.1]
  def change
    add_column :pay_fees, :user_id, :integer
    add_column :pay_fees, :user_type, :string
  end
end
