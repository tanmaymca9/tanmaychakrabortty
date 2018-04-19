class AddAttachmentProfileImageDocumentToUsers < ActiveRecord::Migration[5.1]
  def self.up
    change_table :users do |t|
      t.attachment :profile_image
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :users, :profile_image
    remove_attachment :users, :document
  end
end
