class Admins::SessionsController < Devise::SessionsController
# before_filter :configure_sign_in_params, only: [:create]

def welcome0
end
  # GET /resource/sign_in
  # def new
  #   super
  # end

def destroy
  super  
end
def new
  super
end 
def create
  super
  end
  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected
  # def after_sign_in_path_for(resource)
  # home_detail_path
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
end