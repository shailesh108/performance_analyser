class Admins::SessionsController < Devise::SessionsController
before_filter: configure_sign_in_params, only: [: create]
def welcome
end
GET / resource / sign_in
def new
super
end
def destroy
super
end
def new
super
end
def create
super
end
protected
def after_sign_in_path_for(resource)
admin_welcome_path
end
def after_sign_out_path_for(resource)
root_path
end
end