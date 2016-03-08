module StudentsHelper
   def test_status(test)
    time_now = Time.now.strftime("%d-%m-%Y %H:%M %p")
    test_start_time = test.test_datetime.strftime("%d-%m-%Y %H:%M %p")
    test_finish_time = (test.test_datetime + test.total_time.minutes).strftime("%d-%m-%Y %H:%M %p")
    if (test_start_time > time_now)
      return "<button id='test_status' class='btn btn-danger btn-xs disabled'>Pending</button>".html_safe     
    elsif (test_start_time <= time_now && time_now < test_finish_time)
      return link_to("Pending".html_safe,starttest_students_path(test),:class => "btn btn-danger btn-xs")
    else
      return "<button class='btn btn-success btn-xs'>Complete</button>".html_safe 
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

  def get_test_time(test)
     test.test_datetime.strftime("%d-%m-%Y %H:%M:%S").to_json
  end

end