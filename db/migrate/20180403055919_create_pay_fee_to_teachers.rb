class CreatePayFeeToTeachers < ActiveRecord::Migration[5.1]
  def change
    create_table :pay_fee_to_teachers do |t|
      t.string :name
      t.string :email
      t.string :phone_no
      t.string :teacher_name
      t.integer :user_id
      t.string :user_role

      t.timestamps
    end
  end
end
