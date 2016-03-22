class Test < ActiveRecord::Base
	belongs_to :teacher
	belongs_to :standard_subject
  has_many :results, dependent: :destroy
	has_many :questions, dependent: :destroy
	validates :test_name, :test_datetime, :no_of_questions, :total_time, presence:true
	validates :total_time, :no_of_questions, numericality:{only_integer: true}
 	has_many :questions, :dependent => :destroy
  
end
