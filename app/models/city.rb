class City < ApplicationRecord
	belongs_to :stat, optional: true
end
