class AddSubjectRefToStandardSubjects < ActiveRecord::Migration
	def change
		add_reference :standard_subjects, :subject, index: true, foreign_key: true
	end
end
