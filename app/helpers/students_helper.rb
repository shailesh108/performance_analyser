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
      return "<button class='btn btn-success btn-xs'>Finish</button>".html_safe 
    end
  end

   def get_test_time
    return Test.order(test_datetime: :desc).pluck(:test_datetime).last.strftime("%d-%m-%Y %H:%M:%S").to_json
  end
def get_test_finish_time
    test = Test.order(test_datetime: :desc).last
    total_time = test.total_time
    return test_finish_time = (test.test_datetime + total_time.minutes).strftime("%d-%m-%Y %H:%M:%S").to_json
  end

def days_remain(test)
  days=(test.test_datetime.to_date-DateTime.now.to_date).to_i
  if days>0
    return  days.to_s+"  Days to Go"
  end
  if days==0
     return  "Today"
  end

end


def get_student_avatar
  image_tag("/avatars/students/originals/" + @student.avatar_file_name)
end
def profile_student_avatar
  image_tag("/avatars/students/originals/" + current_student.avatar_file_name, :class=>"img-responsive")
end

def individual_test_rank(res)
  per=Result.where(:test_id=>res.test_id).pluck(:percentage)
  per.reverse
  return per.index(res.percentage)+1
end
def all_test_rank
  per=Student.where(:standard_id=>current_student.standard_id).joins(:results).distinct.map{|stu| stu.results.map{|per| per.percentage}}
  rank=per.map{|p| p.sum/p.size}
  rank.sort!
  t=rank.reverse!
  return t.index(test_avg_performance).to_i+1
  end


#----------Student Charts------------------

def total_test_chart
  attmp=@complete_tests.count
  total= @not_attended_tests.count
  data ={"Test Attended"=>attmp,"Not Attended Test"=>total}
  return "#{column_chart data , width: "230px", height: "200px" }".html_safe
end
def all_test_performance_chart
    att=current_student.results
    testname=att.pluck(:test_id,:percentage).map{|a,k| Test.find(a).test_name}
    per = att.pluck(:percentage)
    @data1=testname.zip(per)
    return "#{line_chart @data1,label:"Percentage",xtitle: "Test Name", ytitle: "Percentage" , height: "200px",discrete: true}".html_safe
end
def test_avg_performance
  att=current_student.results
    data1 = att.pluck(:percentage)
    return data1.sum/data1.size
end

end