class SellBook < ApplicationRecord
  validates_presence_of :title,:description,:price,:book
  has_attached_file :book
  validates_attachment :book, :content_type => { :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif",
   "application/pdf", "application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document" ] }
end
