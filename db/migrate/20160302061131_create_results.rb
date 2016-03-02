class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.string :attempted_question
      t.string :correct_question
      t.string :incorrect_question
      t.timestamps null: false
    end
  end
end
