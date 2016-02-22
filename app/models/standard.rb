class Standard < ActiveRecord::Base
	has_many :students
	has_many :standard_subjects
	validates :name ,presence: true
end
