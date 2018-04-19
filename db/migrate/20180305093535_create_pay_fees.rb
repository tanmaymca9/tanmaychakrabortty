class CreatePayFees < ActiveRecord::Migration[5.1]
  def change
    create_table :pay_fees do |t|
      t.string :name
      t.string :email
      t.integer :phone_no
      t.string :name_of_school

      t.timestamps
    end
  end
end
