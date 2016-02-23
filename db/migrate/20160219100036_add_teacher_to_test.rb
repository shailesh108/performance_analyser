class AddTeacherToTest < ActiveRecord::Migration
  def change
    add_reference :tests, :teacher, index: true, foreign_key: true
  end
end
