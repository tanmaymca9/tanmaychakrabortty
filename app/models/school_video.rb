class SchoolVideo < ApplicationRecord
	belongs_to :user
	validates_presence_of :title, :description, :video
	#validates_presence_of :title, :description, :video
	has_attached_file :video
	validates_attachment :video, content_type: { content_type: ["video/mp4"] }
end
