class ChangePhoneNoToStringInFee < ActiveRecord::Migration[5.1]
  def change
  	change_column :pay_fees, :phone_no, :string
  end
end
