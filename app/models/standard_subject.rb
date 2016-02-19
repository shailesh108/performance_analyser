class StandardSubject < ActiveRecord::Base
	belongs_to :standard
	belongs_to :subject
end
