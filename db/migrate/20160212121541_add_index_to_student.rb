class AddIndexToStudent < ActiveRecord::Migration
  def change
  	add_index :students,:enrollment_no
    end
end