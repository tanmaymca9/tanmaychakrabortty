class PayFee < ApplicationRecord
	belongs_to :user, polymorphic: true
	validates_presence_of :name_of_school
end
