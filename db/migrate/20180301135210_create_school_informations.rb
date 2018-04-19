class CreateSchoolInformations < ActiveRecord::Migration[5.1]
  def change
    create_table :school_informations do |t|
      t.string :title
      t.text :description
      t.string :url
      t.integer :user_id

      t.timestamps
    end
  end
end
