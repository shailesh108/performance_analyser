module ApplicationHelper
	def current_user?
    student_signed_in? || teacher_signed_in? || admin_signed_in?
  end
  def signout_path
    student_signed_in? ? destroy_student_session_path : (teacher_signed_in? ? destroy_teacher_session_path : (admin_signed_in? ? destroy_admin_session_path : return ))
  end
  
end
