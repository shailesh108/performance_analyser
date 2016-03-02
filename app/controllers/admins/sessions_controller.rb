class Admins::SessionsController < Devise::SessionsController
  layout 'login_layout'
  def new
    super
  end

  def destroy
    super  
  end

  def create
    super
  end
  protected

  def after_sign_in_path_for(resource)
  admin_welcome_path
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.for(:sign_in) << :attribute
  end
end
