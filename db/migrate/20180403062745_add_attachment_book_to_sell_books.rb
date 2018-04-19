class AddAttachmentBookToSellBooks < ActiveRecord::Migration[5.1]
  def self.up
    change_table :sell_books do |t|
      t.attachment :book
    end
  end

  def self.down
    remove_attachment :sell_books, :book
  end
end
