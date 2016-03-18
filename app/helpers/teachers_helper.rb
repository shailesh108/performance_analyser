module TeachersHelper
	def display_full_teacher_name
		return "#{@teacher.first_name+" "+@teacher.middle_name+" "+@teacher.last_name}"
	end

	def return_standard(tea_std_sub)
		return tea_std_sub.standard_subject.standard.name
	end

	def return_subject(tea_std_sub)
		return tea_std_sub.standard_subject.subject.sub_name
	end

	def get_teacher_avatar
		image_tag("/avatars/teachers/originals/" + @teacher.avatar_file_name)
	end

	def display_total_subjects
		return @teacher.teacher_standard_subjects.count
	end
	
	def all_student_performance_chart
     @stu_perfommance=Test.joins(:teacher).where("teacher_id=?",current_teacher.id).joins(:results).group(:student_id).average(:percentage)
    return "#{area_chart @stu_perfommance ,label:"Percentage",xtitle: "Student Name", ytitle: "Percentage" , widht:"300px",height: "200px",discrete: true ,colors: [ "#b94646"]}".html_safe
  end

  def all_test_attendance_chart
  	@g_data=current_teacher.tests.joins(:results).distinct.group(:test_name).count(:student_id)
    return "#{column_chart @g_data ,label: "Attended Test",width: "250px", height: "200px",colors:[ "#b94646","#a48a9e", "#c6e1e8"]}".html_safe
 	end

 	def stu_name(id)
 		return Student.find(id).first_name
 	end

  def std_name(id)
    return Student.find(id).standard.name
  end
end
