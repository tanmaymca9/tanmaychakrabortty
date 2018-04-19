class Overview < ApplicationRecord
	belongs_to :user, polymorphic: true
	validates_presence_of :title, :description


	
end
