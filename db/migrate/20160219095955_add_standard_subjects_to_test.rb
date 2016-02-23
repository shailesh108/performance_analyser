class AddStandardSubjectsToTest < ActiveRecord::Migration
  def change
    add_reference :tests, :standard_subject, index: true, foreign_key: true
  end
end
