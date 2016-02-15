class AddFieldsToTeacher < ActiveRecord::Migration
  def change
  	add_column :teachers, :first_name, :string
  	add_column :teachers, :middle_name, :string
  	add_column :teachers, :last_name, :string
  	add_column :teachers, :dateofbirth, :date
  	add_column :teachers, :address ,:string
  	add_column :teachers, :city , :string
  	add_column :teachers, :contactno,:string
  end
end
