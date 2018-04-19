class CreateVendorRequires < ActiveRecord::Migration[5.1]
  def change
    create_table :vendor_requires do |t|
      t.string :name
      t.string :location
      t.string :article
      t.string :vendor_value
      t.boolean :supplier
      t.integer :user_id

      t.timestamps
    end
  end
end
