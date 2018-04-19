class Stat < ApplicationRecord
	belongs_to :countr, optional: true
	has_many :city
end
