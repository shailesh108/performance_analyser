module StudentsHelper
  def test_status(test)
    if (test.test_datetime>DateTime.now)
      return  "#{link_to "Pending",starttest_students_path(test),class: "btn btn-danger btn-xs"}".html_safe
    else
      return  "#{link_to "Complete","#",class: "btn btn-success btn-xs"}".html_safe
    end
  end

  def days_remain(test)
    days=(test.test_datetime.to_date-DateTime.now.to_date).to_i
    if days>0
      return  days.to_s+"  Days to Go"
    end
  end
end