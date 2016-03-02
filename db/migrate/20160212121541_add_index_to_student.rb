class AddIndexToStudent < ActiveRecord::Migration
  def change
  	# add_column :students,:email,:string
  	add_index :students,:enrollment_no
    end
end
