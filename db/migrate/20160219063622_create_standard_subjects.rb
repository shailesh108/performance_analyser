	class CreateStandardSubjects < ActiveRecord::Migration
  def change
    create_table :standard_subjects do |t|
    	t.belongs_to :standard
    	t.belongs_to :subject
    	
      t.timestamps null: false
    end
  end
end
