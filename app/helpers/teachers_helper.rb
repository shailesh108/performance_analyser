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
	
end
