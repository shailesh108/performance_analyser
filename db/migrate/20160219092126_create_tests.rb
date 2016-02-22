class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :test_name
      t.datetime :test_datetime
      t.time :total_time
      t.integer :no_of_questions
      t.integer :status

      t.timestamps null: false
    end
  end
end
