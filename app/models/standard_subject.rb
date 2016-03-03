class StandardSubject < ActiveRecord::Base
	belongs_to :standard
	belongs_to :subject
	has_many :tests
	has_many :teacher_standard_subjects
end
