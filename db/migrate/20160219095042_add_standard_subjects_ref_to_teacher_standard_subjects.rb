class AddStandardSubjectsRefToTeacherStandardSubjects < ActiveRecord::Migration
  def change
    add_reference :teacher_standard_subjects, :standard_subjects, index: true, foreign_key: true
  end
end
