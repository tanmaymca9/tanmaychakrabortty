class Cutoff < ApplicationRecord
	validates_presence_of :name, :category, :rank, :examination, :percentage
end
