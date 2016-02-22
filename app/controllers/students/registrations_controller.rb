class Students::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_sign_up_params, only: [:create]
  # before_filter :configure_account_update_params, only: [:update]
  
 # GET /resource/sign_up
  def new
     super
   end
# def list
#   @students=Student.all
# end
  # POST /resource
   def create

    
     super
     end

  # GET /resource/edit
  #  def edit
  #  super
  # end

  # # PUT /resource
  #  def update
  #    super
  #  end

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

   protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.for(:sign_up) << :attribute
  # end

  # If you have extra params to permit, append them to the sanitizer.

    def configure_sign_up_params

      devise_parameter_sanitizer.for(:sign_up) << :enrollment_no
      devise_parameter_sanitizer.for(:sign_up) << :email
      devise_parameter_sanitizer.for(:sign_up) << :first_name
 	     devise_parameter_sanitizer.for(:sign_up) << :middle_name

      devise_parameter_sanitizer.for(:sign_up) << :last_name
      devise_parameter_sanitizer.for(:sign_up) << :date_of_birth

      devise_parameter_sanitizer.for(:sign_up) << :address

      devise_parameter_sanitizer.for(:sign_up) << :city

      devise_parameter_sanitizer.for(:sign_up) << :contactno

      devise_parameter_sanitizer.for(:sign_up) << :standard_id

   end
  # The path used after sign up.
   def after_sign_up_path_for(resource)
      sign_out resource
      list_student_path
   end
 end
