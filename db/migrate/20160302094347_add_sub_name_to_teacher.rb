class AddSubNameToTeacher < ActiveRecord::Migration
  def change
    add_column :teachers, :sub_name, :string
  end
end
