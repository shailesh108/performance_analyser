class AddFieldsToStudent < ActiveRecord::Migration
  def change
  	add_column :students,:enrollment_no,:string
  	add_column :students,:first_name,:string
  	add_column :students,:middle_name,:string
  	add_column :students,:last_name,:string
  	add_column :students,:date_of_birth,:date
  	add_column :students,:address,:text
  	add_column :students,:city,:string
  	add_column :students,:contactno,:string
  	add_column :students,:standard_id,:integer
  end
end
