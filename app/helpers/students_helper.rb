module StudentsHelper
	def get_student_avatar
		image_tag("/avatars/students/originals/" + @student.avatar_file_name)
	end
end
