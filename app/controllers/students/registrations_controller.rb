class Students::RegistrationsController < Devise::RegistrationsController
before_filter: configure_sign_up_params, only: [:create]
def new
super
end
def create
super
end
protected
def configure_sign_up_params
devise_parameter_sanitizer.for(: sign_up) << : enrollment_no
devise_parameter_sanitizer.for(: sign_up) << : email
devise_parameter_sanitizer.for(: sign_up) << : first_name
devise_parameter_sanitizer.for(: sign_up) << : middle_name
devise_parameter_sanitizer.for(: sign_up) << : last_name
devise_parameter_sanitizer.for(: sign_up) << : date_of_birth
devise_parameter_sanitizer.for(: sign_up) << : address
devise_parameter_sanitizer.for(: sign_up) << : city
devise_parameter_sanitizer.for(: sign_up) << : contactno
devise_parameter_sanitizer.for(: sign_up) << : standard_id
end
def after_sign_up_path_for(resource)
sign_out resource
list_student_path
end
end