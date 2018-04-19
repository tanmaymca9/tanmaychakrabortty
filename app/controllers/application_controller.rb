class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if current_admin.present?
      admins_path
    else
      if resource.role == "student"
        unless fields_check(current_user)
         flash[:notice] = "Please complete your profile to proceed futher"
         edit_user_registration_path
        else
         students_path
        end
      elsif resource.role == "school"
        unless fields_check(current_user)
         flash[:notice] = "Please complete your profile to proceed futher"
         edit_user_registration_path
        else
         schools_path
        end
      elsif resource.role == "teacher"
        unless fields_check(current_user)
         flash[:notice] = "Please complete your profile to proceed futher"
         edit_user_registration_path
        else
         teachers_path
        end
      elsif resource.role == "vendor"
        unless fields_check(current_user)
         flash[:notice] = "Please complete your profile to proceed futher"
         edit_user_registration_path
        else
         vendors_path
        end
      else resource.role == " "
        students_path
      end
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone_no, :gender, :address, :city, :pincode, :country, :gender, :role,
              :profile_image, :document, :qualification])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone_no, :gender, :address, :city, :pincode, :country, :gender, :role,
       :profile_image, :document, :qualification, :cover_image, :description,:country_id,:state_id,:city_id])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email,:password])
  end

  protected
    def check_user_signed_in
      if !user_signed_in?
        redirect_to user_session_path
      end
    end

    def fields_check(resource)
      resource.name.present? && resource.address.present? && resource.qualification.present?
    end
end