class VendorsController < ApplicationController
before_action :set_vendor, only:[:index,:schools,:apply_school,:vendor_openings]

	def index
		@schools_count = @vendor.applied_schools.count
	end

  	def schools
		@schools = User.where(:role => "school")
	    @name = @schools.pluck(:name)
	    @city_id = @schools.pluck(:city_id)
	    @cities = City.find(@city_id)
	    @search = User.where("name = ? AND city_id= ?", params[:name],params[:city_id]) if params[:name] && params[:city_id].present?
	end

	def vendor_openings
		@user = User.find(params[:vendor_id])
		@vendors = @user.vendor_requires
	end
	def apply_school
		if request.get?
			@apply_school = AppliedSchool.new
			@vendor = VendorRequire.find(params[:vendor_id])
		else
			@apply_school = @vendor.applied_schools.create(apply_school_params)
		    if @apply_school.save
		        redirect_to vendor_schools_path
		    else 
		    end
		end 
	end

	private

	def set_vendor
	    @vendor = User.find_by_id(current_user)
	end

  	def apply_school_params
    	params.require(:applied_school).permit(:name,:email,:phone_no,:description,:school_id,:user_id, :role)
  	end
end
