class CreateSlots < ActiveRecord::Migration[5.1]
  def change
    create_table :slots do |t|
      t.string :name
      t.string :date
      t.string :time
      t.string :duration
      t.integer :user_id

      t.timestamps
    end
  end
end
