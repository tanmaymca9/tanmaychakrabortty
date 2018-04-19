class AddAttachmentPictureToSchoolPictures < ActiveRecord::Migration[5.1]
  def self.up
    change_table :school_pictures do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :school_pictures, :picture
  end
end
