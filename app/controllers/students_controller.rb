class StudentsController < ApplicationController
  before_action :set_school

  def index
    @schools_count = @student.applied_schools.count
    @teachers_count = @student.applied_teachers.count
  end

  def pay_fees_school
    @school_name = User.where(:role => "school")
  	 if request.get?
      @school_fees = PayFee.new
    else
      @school_fees = @student.pay_fees.create(pay_fee_params)
      if @school_fees.save
        redirect_to student_fee_details_path 
      else 
      end
    end 
  end

  def fee_details
  end

  def pay_fees_tutor
    @teacher_name = User.where(:role => "teacher")
     if request.get?
      @teacher_fees = PayFeeToTeacher.new
    else
      @teacher_fees = @student.pay_fee_to_teachers.create(pay_fee_to_teacher_params)
      if @teacher_fees.save
        redirect_to students_path 
      else 
      end
    end 
  end

  def sale_book
     if request.get?
      @sale_book = SellBook.new
    else
      @sale_book = @student.sell_books.create(sale_book_params)
      if @sale_book.save
        redirect_to students_path 
      else 
      end
    end 
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
      @school = User.find_by_id(params[:student_id])
    else
      @apply_school = @student.applied_schools.create(apply_school_params)
        if @apply_school.save
            redirect_to student_schools_path
        else 
        end
      end 
  end

  def teachers
    @teachers = User.where(:role => "teacher")
    @name = @teachers.pluck(:name)
    @city_id = @teachers.pluck(:city_id)
    @cities = City.find(@city_id)
    @subjects = @teachers.pluck(:qualification).uniq
    @search = User.where("name = ? AND city_id= ? AND qualification= ?",
      params[:name],params[:city_id],params[:qualification]) if params[:name] && params[:city_id] && params[:qualification].present?
  end
  def apply_teacher
    if request.get?
      @apply_teacher = AppliedTeacher.new
      @teacher = User.find_by_id(params[:student_id])
    else
      @apply_teacher = @student.applied_teachers.create(apply_teacher_params)
        if @apply_teacher.save
            redirect_to student_teachers_path
        else 
        end
      end 
  end

  def slots
    @apply_teacher = AppliedTeacher.new
    @teacher = User.find(params[:student_id])
    @slots = @teacher.slots
  end


  private

  def set_school
      @student = User.find_by_id(current_user)
  end

  def pay_fee_params
  	params.require(:pay_fee).permit(:name,:email,:phone_no,:name_of_school,:user_id,:user_type)
  end

  def pay_fee_to_teacher_params
    params.require(:pay_fee_to_teacher).permit(:name,:email,:phone_no,:teacher_name,:user_id,:user_role)
  end

  def sale_book_params
    params.require(:sell_book).permit(:title,:description,:price,:book,:user_id)
  end

  def apply_school_params
      params.require(:applied_school).permit(:name,:email,:phone_no,:description,:school_id,:user_id,:role)
  end

  def apply_teacher_params
      params.require(:applied_teacher).permit(:name,:email,:phone_no,:description,:teacher_id,:user_id,:user_role)
  end
  
end
