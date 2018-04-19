class CreateSchoolVideos < ActiveRecord::Migration[5.1]
  def change
    create_table :school_videos do |t|
      t.string :title
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end
