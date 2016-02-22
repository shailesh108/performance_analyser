class Subject < ActiveRecord::Base
	has_many :standard_subjects
	validates :sub_name ,presence: true
end
