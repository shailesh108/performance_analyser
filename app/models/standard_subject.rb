class StandardSubject < ActiveRecord::Base
	belongs_to :standard
	belongs_to :subject
	has_many :tests
end
