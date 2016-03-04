class Standard < ActiveRecord::Base
	has_many :standard_subjects
  has_many :subjects, through: :standard_subjects
  has_many :tests, through: :standard_subjects
  validates :name ,presence: true
end
