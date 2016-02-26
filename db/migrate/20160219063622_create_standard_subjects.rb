class CreateStandardSubjects < ActiveRecord::Migration
	def change
		create_table :standard_subjects do |t|
			t.timestamps null: false
		end
	end
end
