class TeacherStandardSubject < ActiveRecord::Base
	belongs_to :teacher
	belongs_to :standard_subject
end
