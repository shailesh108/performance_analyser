class ChangeTotalTimeFormatInTestTable < ActiveRecord::Migration
	remove_column :tests, :total_time, :time
	add_column :tests, :total_time, :integer
end
