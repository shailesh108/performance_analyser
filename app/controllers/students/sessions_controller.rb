class Students::SessionsController < Devise::SessionsController
  layout 'login_layout'
  before_filter :configure_sign_in_params, only: [:create]
  def new
    super
  end

  

def create
  super
  student = Student.find_by_email(params[:email])
  if student && student.authenticate(params[:password])
    if params[:remember_me]
      cookies.permanent[:auth_token] = student.auth_token
    else
      cookies[:auth_token] = student.auth_token
    end
    redirect_to root_url, :notice => "Logged in!"
  else
    flash.now.alert = "Invalid email or password"

  end
end

def destroy
  super
  cookies.delete(:auth_token)
  
end



  protected

  def after_sign_in_path_for(resource)
    student_welcome_path
  end
  def configure_sign_in_params
    devise_parameter_sanitizer.for(:sign_in) << :enrollment_no
  end
end
