class CreateDemoVideos < ActiveRecord::Migration[5.1]
  def change
    create_table :demo_videos do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.string :user_role

      t.timestamps
    end
  end
end
