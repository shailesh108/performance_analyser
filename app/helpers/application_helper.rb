module ApplicationHelper
	def current_user?
    student_signed_in? || teacher_signed_in? || admin_signed_in?
  end
  def signout_path
    student_signed_in? ? destroy_student_session_path : (teacher_signed_in? ? destroy_teacher_session_path : (admin_signed_in? ? destroy_admin_session_path : return ))
  end
  
  def add_user_path
  	if teacher_signed_in?
  		link_to "Add Student", new_student_path 
  		
  	elsif admin_signed_in?
  		link_to "Add Teacher",new_teacher_path
  	end	
  end

  def list_user_path
  	if teacher_signed_in?
  		link_to "List Student", list_students_path 
  	elsif admin_signed_in?
  		link_to "List Teacher", list_teachers_path 
  	end
  end
  def user
  	if teacher_signed_in?
  		return "Student"
  	elsif admin_signed_in?
  		return "Teacher"
  	end
  end
  def about_test
  	if teacher_signed_in?
  		link_to "Add Test",  new_test_path 
  	end
  end

  def list_test
    if teacher_signed_in?
      link_to "List Test",  tests_path 
    end
  end
  def search_path
  	if  admin_signed_in?
  		link_to "Search Teacher", search_teachers_path 
  	end
  end
  def user_name
  	if teacher_signed_in?
		return "#{current_teacher.first_name.capitalize+" "+current_teacher.last_name.capitalize}"
	elsif  admin_signed_in?
		return "#{Admin}"
	elsif student_signed_in?
		return "#{current_student.first_name.capitalize+" "+current_student.last_name.capitalize}"
	end
end
def user_img
	if teacher_signed_in?
		image_tag("/avatars/teachers/originals/" + current_teacher.avatar_file_name, :class=>"img-circle")
	elsif admin_signed_in?
			image_tag("default.jpg", :class => "img-circle")
	else
		image_tag("/avatars/students/originals/" + current_student.avatar_file_name, :class=>"img-circle")
	end
end

def user_profile
  if teacher_signed_in?
    link_to "Profile" , list_teachers_path 
  elsif student_signed_in?
      link_to "Profile" ,list_students_path 
  end
end

def graph
  if teacher_signed_in?
       link_to "Graph" ,teacher_graph_path 
  end
end
def search_user
  if teacher_signed_in?
      render :partial => "teachers/search"
  elsif student_signed_in?
       render :partial => "students/search"
     else
       render :partial => "teachers/search"
  end
end
end
