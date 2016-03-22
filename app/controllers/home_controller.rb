class HomeController < ApplicationController
	layout 'login_layout'
	def index
    if teacher_signed_in?
      redirect_to list_students_path
    end
    if admin_signed_in?
      redirect_to list_teachers_path
    end
    if student_signed_in?
      redirect_to student_welcome_path
    end
	end
end
