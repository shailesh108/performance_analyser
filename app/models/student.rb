class Student < ActiveRecord::Base
	belongs_to:standard
	validates :first_name, :middle, :last_name, :date_of_birth, :address, :city, :contactno,numericality:{only_integer}, :standard_id,presence:true
  devise :database_authenticatable, :registerable,:trackable, :validatable, :authentication_keys=>[:enrollment_no]
  def email_required?
  false
	end
end