class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :enrollment_no
      t.string :password
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.date :date_of_birth
      t.text :address
      t.string :city
      t.string :contactno
      t.integer :standard_id

      t.timestamps null: false
    end
  end
end
