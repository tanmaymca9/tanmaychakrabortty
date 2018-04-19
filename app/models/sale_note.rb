class SaleNote < ApplicationRecord
  validates_presence_of :title, :description, :document
  has_attached_file :document
  validates_attachment :document, :content_type => { :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif", "application/pdf", "application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document" ] }
end



