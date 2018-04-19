class SchoolsController < ApplicationController
before_action :set_school, only:[:overview,:update_overview,:courses,:update_course, :course,
  :scholarship,:scholarships,:update_scholarship,:placements,:update_placement,:placement,
  :cutoffs, :cutoff,:update_cuttoff,:campus,:campu,:update_campu,:schoolinformations,:schoolinformation,
  :update_schoolinformation,:schoolpictures,:schoolpicture,:update_schoolpicture,:schoolvideos,
  :schoolvideo,:update_schoolvideo,:teachers,:vendors,:students,:teacher_requirement,:vendor_requirement]

 before_action :check_user_signed_in
  def index
    @course_count = Course.where("user_id = ?",set_school).count
    @scholar_count = Scholarship.where("user_id = ?",set_school).count
    @placement_count = Placement.where("user_id = ?",set_school).count
    @cutoff_count = Cutoff.where("user_id = ?",set_school).count
    @campus_count = Campu.where("user_id = ?",set_school).count
    @news_count = SchoolInformation.where("user_id = ?",set_school).count
    @picture_count = SchoolPicture.where("user_id = ?",set_school).count
    @video_count = SchoolVideo.where("user_id = ?",set_school).count
    @teachers_count = AppliedSchool.where("school_id = ? AND role= ?",@school,"teacher").count
    @vendors_count = AppliedSchool.where("school_id = ? AND role= ?",@school,"vendor").count
    @students_count = AppliedSchool.where("school_id = ? AND role= ?",@school,"student").count
  end

  def teachers
    @teacher_requirements = @school.teacher_requires
  end
  def vendors
    @vendor_requirements = @school.vendor_requires
  end
  def students
    @students = AppliedSchool.where("school_id = ? AND role= ?",@school,"student")
  end

  def overview
    if request.get?
      @overview = Overview.new
    else
      @overview = @school.overviews.create(overview_params)
      if @overview.save
        redirect_to schools_path
      else 
      end
    end 
  end

  def update_overview
    if request.get?
      @id = @school.overviews.first
      @overview = Overview.find_by_id(@id)
    else
      if @school.overviews.update(overview_params)
        redirect_to schools_path
      else 
      end
    end
  end

  def courses
    @courses = @school.courses
  end
  def course
    if request.get?
      @course = Course.new
    else
      @course = @school.courses.create(course_params)
      @course.degree_name = params[:new_degree_name] unless params[:new_degree_name].empty?
      @course.course_name = params[:new_course_name] unless params[:new_course_name].empty?
      if @course.save
        redirect_to school_courses_path
      else 
      end
    end 
  end
  def update_course
    if request.get?
      @course = Course.find(params[:school_id])
    else
      @course = Course.find(params[:school_id])
      @course.degree_name = params[:new_degree_name] unless params[:new_degree_name].empty?
      @course.course_name = params[:new_course_name] unless params[:new_course_name].empty?
      if @course.update(course_params)
        redirect_to school_courses_path
      else
      end
    end
  end
  def destroy_course
    @course = Course.find(params[:school_id])
    if @course.delete
      redirect_to school_courses_path
    else
    end
  end

  def scholarships
    @scholars = @school.scholarships
  end
  def scholarship
    if request.get?
      @scholar = Scholarship.new
    else
      @scholar = @school.scholarships.create(scholar_params)
        if @scholar.save
          redirect_to school_scholarships_path
        else 
        end
    end 
  end
  def update_scholarship
    if request.get?
      @scholar = Scholarship.find(params[:school_id])
    else
      @scholar = Scholarship.find(params[:school_id])
      if @scholar.update(scholar_params)
        redirect_to school_scholarships_path
      else
      end
    end
  end
  def destroy_scholarship
    @scholar = Scholarship.find(params[:school_id])
    if @scholar.destroy
      redirect_to school_scholarships_path
    else
    end
  end

  def placements
    @placements = @school.placements
  end
  def placement
    if request.get?
      @placement = Placement.new
    else
      @placement = @school.placements.create(placement_params)
        if @placement.save
          redirect_to school_placements_path,notice: 'Placement details saved successfully'
        else 
        end
    end 
  end
  def update_placement
    if request.get?
      @placement = Placement.find(params[:school_id])
    else
      @placement = Placement.find(params[:school_id])
      if @placement.update(placement_params)
        redirect_to school_placements_path
      else
      end
    end
  end
  def destroy_placement
    @placement = Placement.find(params[:school_id])
    if @placement.destroy
      redirect_to school_placements_path
    else
    end
  end

  def cutoffs
    @cutoffs = @school.cutoffs
  end
  def cutoff
    if request.get?
      @cutoff = Cutoff.new
    else
      @cutoff = @school.cutoffs.create(cutoff_params)
        if @cutoff.save
          redirect_to school_cutoffs_path
        else 
        end
    end 
  end
  def update_cutoff
    if request.get?
      @cutoff = Cutoff.find(params[:school_id])
    else
      @cutoff = Cutoff.find(params[:school_id])
      if @cutoff.update(cutoff_params)
        redirect_to school_cutoffs_path
      else
      end
    end
  end
  def destroy_cutoff
    @cutoff = Cutoff.find(params[:school_id])
    if @cutoff.destroy
      redirect_to school_cutoffs_path
    else
    end
  end

  def campus
    @campus = @school.campus
  end
  def campu
    if request.get?
      @campu = Campu.new
    else
      @campu = @school.campus.create(campu_params)
        if @campu.save
          redirect_to school_campus_path
        else 
        end
    end 
  end
  def update_campu
    if request.get?
      @campu = Campu.find(params[:school_id])
    else
      @campu = Campu.find(params[:school_id])
      if @campu.update(campu_params)
        redirect_to school_campus_path
      else
      end
    end
  end
  def destroy_campu
    @campu = Campu.find(params[:school_id])
    if @campu.destroy
      redirect_to school_campus_path
    else
    end
  end

  def schoolinformations
    @news = @school.school_informations
  end
  def schoolinformation
    if request.get?
      @news = SchoolInformation.new
    else
      @news = @school.school_informations.create(news_params)
        if @news.save
          redirect_to school_schoolinformations_path
        else 
        end
    end 
  end
  def update_schoolinformation
    if request.get?
      @news = SchoolInformation.find(params[:school_id])
    else
      @news = SchoolInformation.find(params[:school_id])
      if @news.update(news_params)
        redirect_to school_schoolinformations_path
      else
      end
    end
  end
  def destroy_schoolinformation
    @news = SchoolInformation.find(params[:school_id])
    if @news.destroy
      redirect_to school_schoolinformations_path
    else
    end
  end

  def schoolpictures
    @pictures = @school.school_pictures
  end
  def schoolpicture
    if request.get?
      @picture = SchoolPicture.new
    else
      @picture = @school.school_pictures.create(schoolpicture_params)
        if @picture.save
          @school.create_picture(params[:images]) if params[:images]
          redirect_to school_schoolpictures_path
        else 
        end
    end 
  end
  def update_schoolpicture
    if request.get?
      @picture = SchoolPicture.find(params[:school_id])
    else
      @picture = SchoolPicture.find(params[:school_id])
      if @picture.update(schoolpicture_params)
        redirect_to school_schoolpictures_path
      else
      end
    end
  end
  def destroy_schoolpicture
    @picture = SchoolPicture.find(params[:school_id])
    if @picture.destroy
      redirect_to school_schoolpictures_path
    else
    end
  end

  def schoolvideos
    @videos = @school.school_videos
  end
  def schoolvideo
    if request.get?
      @video = SchoolVideo.new
    else
      @video = @school.school_videos.create(schoolvideo_params)
        if @video.save
          redirect_to school_schoolvideos_path
        else 
        end
    end 
  end
  def update_schoolvideo
    if request.get?
      @video = SchoolVideo.find(params[:school_id])
    else
      @video = SchoolVideo.find(params[:school_id])
      if @video.update(schoolvideo_params)
        redirect_to school_schoolvideos_path
      else
      end
    end
  end
  def destroy_schoolvideo
    @video = SchoolVideo.find(params[:school_id])
    if @video.destroy
      redirect_to school_schoolvideos_path
    else
    end
  end

  def requirements
  end
  def post_requirements
    @teacher_post = TeacherRequire.new
    @vendor_post = VendorRequire.new
  end
  def teacher_requirement
    @post = @school.teacher_requires.create(teacher_require_params)
    if @post.save
      redirect_to schools_path
    else 
    end
  end
  def vendor_requirement
    @post = @school.vendor_requires.create(vendor_require_params)
    if @post.save
      redirect_to schools_path
    else 
    end
  end

  private

  def set_school
      @school = User.find_by_id(current_user)
  end

  def overview_params
    params.require(:overview).permit(:title, :description, :user_id, :user_type)
  end

  def course_params
    params.require(:course).permit(:course_name,:degree_name,:course_duration,:course_type,
     :course_fee,:course_affliation,:course_description,:user_id,:new_course_name,:new_degree_name)
  end

  def scholar_params
    params.require(:scholarship).permit(:title, :description, :user_id)
  end

  def placement_params
    params.require(:placement).permit(:title, :description, :companies_visited,
      :students_placed, :total_students, :year, :user_id)
  end

  def cutoff_params
    params.require(:cutoff).permit(:name, :category,:rank, :examination, :percentage,
     :user_id)
  end

  def campu_params
    params.require(:campu).permit(:title, :description, :user_id)
  end

  def news_params
    params.require(:school_information).permit(:title, :description, :image, :url, :user_id)
  end

  def schoolpicture_params
    params.require(:school_picture).permit(:title, :description, :picture, :user_id)
  end

  def schoolvideo_params
    params.require(:school_video).permit(:title, :description, :video, :user_id)
  end

  def teacher_require_params
    params.require(:teacher_require).permit(:name,:qualification,:subject,:level,:new_level,
      :experience,:annual_salary,:job_type,:user_id)
  end

  def vendor_require_params
    params.require(:vendor_require).permit(:name,:location,:article,:vendor_value,:supplier,:user_id)
  end

end