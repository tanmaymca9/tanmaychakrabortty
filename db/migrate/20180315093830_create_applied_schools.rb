class CreateAppliedSchools < ActiveRecord::Migration[5.1]
  def change
    create_table :applied_schools do |t|
      t.string :name
      t.string :email
      t.string :phone_no
      t.text :description
      t.integer :school_id
      t.integer :user_id

      t.timestamps
    end
  end
end
