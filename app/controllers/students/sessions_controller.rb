class Students::SessionsController < Devise::SessionsController
  layout 'login_layout'
  before_filter :configure_sign_in_params, only: [:create]
  
  def new
    super
  end

 def create
    super
 end

 def destroy
  super
 end

 protected
 
 def after_sign_in_path_for(resource)
   student_welcome_path
 end
 
 def configure_sign_in_params
   devise_parameter_sanitizer.for(:sign_in) << :enrollment_no
  end

end