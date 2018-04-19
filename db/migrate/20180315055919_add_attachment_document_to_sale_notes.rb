class AddAttachmentDocumentToSaleNotes < ActiveRecord::Migration[5.1]
  def self.up
    change_table :sale_notes do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :sale_notes, :document
  end
end
