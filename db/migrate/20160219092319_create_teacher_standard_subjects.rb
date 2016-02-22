class CreateTeacherStandardSubjects < ActiveRecord::Migration
  def change
    create_table :teacher_standard_subjects do |t|

      t.timestamps null: false
    end
  end
end
