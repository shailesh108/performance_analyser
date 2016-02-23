class AddTeacherRefToTeacherStandardSubjects < ActiveRecord::Migration
  def change
    add_reference :teacher_standard_subjects, :teacher, index: true, foreign_key: true
  end
end
