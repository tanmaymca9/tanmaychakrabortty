class AddAttachmentImageToSchoolInformations < ActiveRecord::Migration[5.1]
  def self.up
    change_table :school_informations do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :school_informations, :image
  end
end
