class AddAttachmentVideoToSchoolVideos < ActiveRecord::Migration[5.1]
  def self.up
    change_table :school_videos do |t|
      t.attachment :video
    end
  end

  def self.down
    remove_attachment :school_videos, :video
  end
end
