module ApplicationHelper
  def current_user?
    student_signed_in? || teacher_signed_in? || admin_signed_in?
  end
  def signout_path
    student_signed_in? ? destroy_student_session_path : (teacher_signed_in? ? destroy_teacher_session_path : (admin_signed_in? ? destroy_admin_session_path : return ))
  end
  

  def add_user_path
    if teacher_signed_in?
      link_to "Add student", new_student_path 
      
    elsif admin_signed_in?
      link_to "Add teacher",new_teacher_path
    else
      link_to "Attended tests",student_testlist_path(:id1=>1)
    end 

  end

  def list_user_path
    if teacher_signed_in?
      link_to "List student", list_students_path 
    elsif admin_signed_in?
      link_to "List teacher", list_teachers_path 
    else
      link_to "Not atttended tests", student_testlist_path(:id1=>2) 
    end
  end
  def test_path1  
    if student_signed_in?
      link_to "Up comming tests", student_testlist_path(:id1=>3)
      elsif admin_signed_in?
      link_to "Search teacher", search_teachers_path
    end
  end
  def user
    if teacher_signed_in?
      return "Student"
    elsif admin_signed_in?
      return "Teacher"
    else
      return "Tests"
    end
  end
  def home
    if student_signed_in?
      link_to "Home", student_welcome_path
    elsif admin_signed_in?
    link_to "Home" , list_teachers_path 
  elsif teacher_signed_in?
    link_to "Home" , list_students_path 
    end
 
end
  def about_test
    if teacher_signed_in?
      link_to "Add test",  new_test_path 
    end
  end

  def list_test
    if teacher_signed_in?
      link_to "List test",  tests_path 
    end
  end
  def search_path
    if  admin_signed_in?
      link_to "Search teacher", search_teachers_path 
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

def profile
  if teacher_signed_in?
       link_to "Profile" ,teacher_profile_path 
  end
end
end