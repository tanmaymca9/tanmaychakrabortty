class VendorRequire < ApplicationRecord
	validates_presence_of :location,:article,:vendor_value,:supplier,:message => "can't be empty"
end
