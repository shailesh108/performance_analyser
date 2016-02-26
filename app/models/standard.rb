class Standard < ActiveRecord::Base
	belongs_to :standard_subject
	validates :name ,presence: true
end
