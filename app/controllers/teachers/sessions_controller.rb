class Teachers::SessionsController < Devise::SessionsController
 layout 'login_layout'

def create
  super
end

def new
  super
end

def destroy
  super
end
protected
# before_filter :configure_sign_in_params, only: [:create]

 

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end

  def after_sign_in_path_for(resource)
  teacher_welcome_path
end
  def after_sign_out_path_for(resource)
    root_path
end


end
