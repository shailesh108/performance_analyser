class AddStandardSubjectsRefToTeacherStandardSubjects < ActiveRecord::Migration
  def change
    add_reference :teacher_standard_subjects, :standard_subject, index: true, foreign_key: true
  end
end
