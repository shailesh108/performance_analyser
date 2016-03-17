module StudentsHelper
def test_status(test)
  if (test.test_datetime>DateTime.now)
   # return  "#{link_to "Pending","#",class: "btn btn-danger btn-xs"}".html_safe
   return  "#{link_to "Pending",starttest_students_path(test),class: "btn btn-danger btn-xs"}".html_safe
   
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
  return "#{column_chart data , width: "230px", height: "200px"}".html_safe
end
end

def all_test_performance_chart
    att=current_student.results
    @data1 = att.pluck(:test_id,:percentage)
    return "#{line_chart @data1, xtitle: "Test Name", ytitle: "Percentage" , height: "200px"}".html_safe
end
def test_avg_performance
  att=current_student.results
    data1 = att.pluck(:percentage)
  #return data1.sum/data1.size
end
