class Teacher < ActiveRecord::Base
has_many :teacher_standard_subjects
has_many :tests
devise :database_authenticatable,:trackable, :validatable,:registerable
validates :first_name,:middle_name,:last_name,:dateofbirth,:address,:city,presence:true
validates :contactno,presence:true,numericality:{only_integer:true}
end
