class Subject < ActiveRecord::Base
	belongs_to :standard_subject
	validates :sub_name ,presence: true
end
