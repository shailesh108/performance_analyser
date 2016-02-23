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

  def after_sign_in_path_for(resource)
    teacher_welcome_path
  end
  def after_sign_out_path_for(resource)
    root_path
  end
end
