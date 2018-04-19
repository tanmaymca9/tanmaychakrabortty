class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  prepend_before_action :require_no_authentication, only: [:new, :create, :cancel]
  #prepend_before_action :check_captcha, only: [:create]
  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  def edit
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
  end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  def update_resource(resource, params)
    # Require current password if user is trying to change password.
    return super if params["password"]&.present?
    # Allows user to update registration information without password.
    resource.update_without_password(params.except("current_password"))
  end

  def after_update_path_for(resource)
    if resource.role == "student"
      students_path
    elsif resource.role == "school"
      schools_path
    elsif resource.role == "teacher"
      teachers_path
    elsif resource.role == "vendor"
      vendors_path
    elsif resource.role == "admin"
      admin_index_path
    else resource.role == " "
      students_index_path
    end
  end

  private
    def check_captcha
      unless verify_recaptcha
        self.resource = resource_class.new sign_up_params
        resource.validate # Look for any other validation errors besides Recaptcha
        respond_with_navigational(resource) { render :new }
      end 
    end
end
