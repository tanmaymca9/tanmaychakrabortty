class AddAttachmentVideoToDemoVideos < ActiveRecord::Migration[5.1]
  def self.up
    change_table :demo_videos do |t|
      t.attachment :video
    end
  end

  def self.down
    remove_attachment :demo_videos, :video
  end
end
