class AdminsController < ApplicationController
before_action :find_admin, only: [:schools,:teachers,:students,:vensors,:school_update,:activate]

	def index
		@schools_count = User.where(:role => "school").count
		@teachers_count = User.where(:role => "teacher").count
		@students_count = User.where(:role => "student").count
		@vendors_count = User.where(:role => "vendor").count
	end

	def schools
		@schools = User.where(:role => "school")
	end
	def teachers
		@teachers = User.where(:role => "teacher")
	end
	def students
		@students = User.where(:role => "student")
	end
	def vendors
		@vendors = User.where(:role => "vendor")
	end
	
	def school_update
		@countries = Countr.all
	    @states = []
	    @cities = []
	    if params[:country].present? or params[:state].present?
	      @states = Stat.where(:countr_id => params[:country] )
	      @cities = City.where(:stat_id => params[:state] )
	    end
	    if request.xhr?
	      respond_to do |format|
	        format.json {
	          render json: {states: @states} if params[:country].present?
	          render json: {cities: @cities} if params[:state].present?
	        }
	      end
	    end
		if request.get?
			@school = User.find(params[:admin_id])
		else
			@user =  User.find(params[:admin_id])
			if @user.update(user_params)
      			if @user.role == "school"
			       	redirect_to admin_schools_path
			       elsif @user.role == "teacher"
			       	redirect_to admin_teachers_path
			       elsif @user.role == "student"
			       	redirect_to admin_students_path
			    else @user.role == "vendor"
			       	redirect_to admin_vendors_path
			    end
		    else
		      redirect_to :back, notice: "Failed to update profile!"
		  end
		end
    end

	def activate
	    @user = User.find(params[:admin_id])
	    if @user.active == false
	       @user.update(active: true)
	       if @user.role == "school"
	       	redirect_to admin_schools_path
	       elsif @user.role == "teacher"
	       	redirect_to admin_teachers_path
	       elsif @user.role == "student"
	       	redirect_to admin_students_path
	       else @user.role == "vendor"
	       	redirect_to admin_vendors_path
	       end
	    else @user.active == true
	       @user.update(active: false)
	       if @user.role == "school"
	       	redirect_to admin_schools_path
	       elsif @user.role == "teacher"
	       	redirect_to admin_teachers_path
	       elsif @user.role == "student"
	       	redirect_to admin_students_path
	       else @user.role == "vendor"
	       	redirect_to admin_vendors_path
	       end
	    end
  	end

  	def video_upload
  		if request.get?
  			@video = SchoolVideo.new
  			@user = User.find(params[:admin_id])
  		else
  			@user = User.find(params[:admin_id])
  			@video = @user.school_videos.create(video_params)
  			if @video.save
  				if @user.role == "school"
	       			redirect_to admin_schools_path
	       		else @user.role == "teacher"
	       			redirect_to admin_teachers_path
	       		end
	       end
	   end
	end

	private

	def find_admin
		@admin = User.find(current_admin.id)
	end

	def user_params
    	params.require(:user).permit(:name,:email,:address,:phone_no,:country_id,:state_id,:city_id,
    	:pincode,:qualification,:description,:profile_image,:cover_image)
  	end

  	def video_params
    	params.require(:school_video).permit(:title, :description, :video, :user_id)
  	end
end
