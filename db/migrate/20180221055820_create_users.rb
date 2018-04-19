class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :address
      t.string :phone_no
      t.string :city
      t.string :country
      t.integer :pincode
      t.boolean :gender

      t.timestamps
    end
  end
end
