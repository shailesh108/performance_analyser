class Test < ActiveRecord::Base
	validates :test_name, :test_datetime, :no_of_questions, :total_time, presence:true
	validates :total_time, :no_of_questions, numericality:{only_integer: true}
  has_many :questions, :dependent => :destroy
  belongs_to :standard_subject
end
