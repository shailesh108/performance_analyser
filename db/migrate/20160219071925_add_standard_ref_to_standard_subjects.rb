class AddStandardRefToStandardSubjects < ActiveRecord::Migration
  def change
    # add_reference :standard_subjects, :standard, index: true, foreign_key: true
  end
end
