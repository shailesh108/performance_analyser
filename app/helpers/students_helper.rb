module StudentsHelper
  def test_status(test)

    time_now = Time.now.strftime("%d-%m-%Y %l:%M %p")
    test_start_time = test.test_datetime.strftime("%d-%m-%Y %l:%M %p")
    test_finish_time = (test.test_datetime + test.total_time.minutes).strftime("%d-%m-%Y %l:%M %p")
   
    if (test_start_time > time_now)
      return link_to("Pending".html_safe,starttest_students_path(test),:class => "btn btn-danger btn-xs disabled") 
    elsif (test_start_time <= time_now && test_finish_time >= time_now) 
       return link_to("Pending".html_safe,starttest_students_path(test),:class => "btn btn-danger btn-xs")
     else
       return link_to("Complete",{},:class => "btn btn-success btn-xs")         
    end
  end

  def days_remain(test)
    days=(test.test_datetime.to_date-DateTime.now.to_date).to_i
    if days>0
      return  days.to_s+"  Days to Go"
    end
  end

  def get_student_avatar
    image_tag("/avatars/students/originals/" + @student.avatar_file_name)
  end

end

