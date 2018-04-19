class TeachersController < ApplicationController
 before_action :set_teacher, only:[:index,:schools,:apply_school,:find_student,:sale_notes,:create_sale_notes,
 :update_sale_notes,:students,:slots,:create_slots,:update_slots,:demo_videos,:create_demo_videos,:update_demo_videos,
 :teacher_openings]
	
 before_action :check_user_signed_in

	def index
		@schools_count = @teacher.applied_schools.count
		@students_count = AppliedTeacher.where("teacher_id = ? AND user_role= ?",@teacher,"student").count
	end

	def schools
		@schools = User.where(:role => "school")
	    @name = @schools.pluck(:name)
	    @city_id = @schools.pluck(:city_id)
	    @cities = City.find(@city_id)
	    @search = User.where("name = ? AND city_id= ?", params[:name],params[:city_id]) if params[:name] && params[:city_id].present?
	end
	def apply_school
		if request.get?
			@apply_school = AppliedSchool.new
			@school = TeacherRequire.find_by_id(params[:teacher_id])
		else
			@apply_school = @teacher.applied_schools.create(apply_school_params)
		    if @apply_school.save
		        redirect_to teacher_schools_path
		    else 
		    end
    	end 
	end

	def find_student
		@students = User.where(:role => "student")
		@name = @students.pluck(:name)
		@qualification = @students.pluck(:qualification).uniq
	    @city_id = @students.pluck(:city_id)
	    @cities = City.find(@city_id)
	    @search = User.where("name = ? AND qualification = ? AND city_id= ?", params[:name],params[:qualification],params[:city_id]) if params[:name] && params[:city_id].present?
	end

	def sale_notes
		@sale_notes = @teacher.sale_notes
	end
	def create_sale_notes
		if request.get?
			@sale_notes = SaleNote.new
		else
			@sale_notes = @teacher.sale_notes.create(sale_notes_params)
		    if @sale_notes.save
		        redirect_to teacher_sale_notes_path
		    else 
		    end
    	end 
	end
	def update_sale_notes
	    if request.get?
	      @sale_notes = SaleNote.find(params[:teacher_id])
	    else
	      @sale_notes = SaleNote.find(params[:teacher_id])
	      if @sale_notes.update(sale_notes_params)
	        redirect_to teacher_sale_notes_path
	      else
	      end
	    end
  	end
  	def sale
	    @sale_notes = SaleNote.find(params[:teacher_id])
	    if @sale_notes.sale == true
	       @sale_notes.update(sale: false)
	       redirect_to teacher_sale_notes_path
	    else @sale_notes.sale == false
	       @sale_notes.update(sale: true)
	       redirect_to teacher_sale_notes_path
	    end
  	end
  	def destroy_sale_notes
	    @sale_notes = SaleNote.find(params[:teacher_id])
	    if @sale_notes.destroy
	      redirect_to teacher_sale_notes_path
	    else
	    end
  	end

  	def slots
  		@slots = @teacher.slots
  	end
  	def create_slots
  		if request.get?
  			@slots = Slot.new
  		else
	  		@slots = @teacher.slots.create(slot_params)
	  		if @slots.save
	  			redirect_to teacher_slots_path
	  		else
	  		end
	  	end
  	end
  	def update_slots
	    if request.get?
	      @slots = Slot.find(params[:teacher_id])
	    else
	      @slots = Slot.find(params[:teacher_id])
	      if @slots.update(slot_params)
	        redirect_to teacher_slots_path
	      else
	      end
	    end
  	end
  	def destroy_slot
	    @slot = Slot.find(params[:teacher_id])
	    if @slot.destroy
	      redirect_to teacher_slots_path
	    else
	    end
  	end

  	def demo_videos
  		@demo_videos = @teacher.demo_videos
  	end
  	def create_demo_videos
  		if request.get?
  			@demo_video = DemoVideo.new
  		else
	  		@demo_video = @teacher.demo_videos.create(demo_video_params)
	  		if @demo_video.save
	  			redirect_to teacher_demo_videos_path
	  		else
	  		end
	  	end
  	end
  	def update_demo_videos
	    if request.get?
	      @demo_video = DemoVideo.find(params[:teacher_id])
	    else
	      @demo_video = DemoVideo.find(params[:teacher_id])
	      if @demo_video.update(demo_video_params)
	        redirect_to teacher_demo_videos_path
	      else
	      end
	    end
  	end
  	def destroy_demo_video
	    @demo_video = DemoVideo.find(params[:teacher_id])
	    if @demo_video.destroy
	      redirect_to teacher_demo_videos_path
	    else
	    end
  	end

  	def teacher_openings
  		@school = User.find(params[:teacher_id])
  		@teachers = @school.teacher_requires
  	end

  	def students
  		@slots = @teacher.slots
  	end

	private

	def set_teacher
	    @teacher = User.find_by_id(current_user)
	end

	def sale_notes_params
    	params.require(:sale_note).permit(:title,:description,:document,:user_id)
  	end

  	def apply_school_params
    	params.require(:applied_school).permit(:name,:email,:phone_no,:description,:school_id,:user_id,:role)
  	end

  	def slot_params
    	params.require(:slot).permit(:name,:date,:time,:duration,:user_id)
  	end

  	def demo_video_params
    	params.require(:demo_video).permit(:title,:description,:video,:user_id,:user_role)
  	end
end
