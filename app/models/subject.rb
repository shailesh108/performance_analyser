class Subject < ActiveRecord::Base
	has_many :standard_subjects
  has_many :standards, through: :standard_subjects
  has_many :tests, through: :standard_subjects
	validates :sub_name ,presence: true
end
