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

end
