class UsersController < ApplicationController
  
  def index
   city_id = User.pluck(:city_id).uniq
   city = City.find(city_id)
   @city = city.reject { |item| item.nil? || item == '' }
   @role = User.pluck(:role).uniq
   @course = Course.pluck(:course_name).uniq
   @school 	= User.where(:role => "school")
   @student = User.where(:role => "student")
   @teacher = User.where(:role => "teacher")
   #@vendor = User.where(:role => "vendor")
   if params[:commit]=="Search"
   		@@first_value = params[:user]
			redirect_to users_search_path
		end	 
  end

  def search
  	@course = Course.all
    city_id = User.pluck(:city_id).uniq
    city = City.find(city_id)
    @city = city.reject { |item| item.nil? || item == '' }
    if params[:myparam1].present?
      @school1 = User.where(:id => params[:myparams]).paginate(:per_page => 1, :page => params[:page])
      render json: {:event => @school1}
    elsif @@first_value.present?
     @school = User.where("city LIKE ? AND role = ?","%#{@@first_value[:city]}%","#{@@first_value[:search_role]}").paginate(:per_page => 4, :page => params[:page])
    else
    end
  end

  def show
    @college 	= User.find(id = params[:id])
    @all_college = User.where(:role => "school")
    @course_detail = @college.courses #All Course Details
    @scholership = @college.scholarships
    @placement = @college.placements
    @news = @college.school_informations
    @gallery = @college.school_pictures
    @videos = @college.school_videos

  end

  def student_show
    @user = User.find(id = params[:id])
    @city = City.find(@user.city_id) if @user.city_id.present?
    @state = Stat.find(@user.state_id) if @user.state_id.present?
    @country = Countr.find(@user.country_id) if @user.country_id.present?
    @slots = @user.slots if @user.slots.present?
    @videos = @user.demo_videos if @user.demo_videos.present?
  end

  def current_requirements
    @user = User.find(params[:format])
    @teachers  = @user.teacher_requires
    @vendors  = @user.vendor_requires
  end

  def apply_to_post
     if !user_signed_in?
      redirect_to new_user_session_path
     else 
        
     end
  end

  def all_view
  end

  def find_all_course_name
    @stream = Course.find_by_id(params[:myparam1])
  end
 
end
