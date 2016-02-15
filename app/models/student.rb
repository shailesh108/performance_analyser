class Student < ActiveRecord::Base
	belongs_to:standard
	validates:enrollment_no,presence:true,uniqueness:true,length:{is:4}
	validates:first_name,presence:true
	validates:middle_name,presence:true
	validates:last_name,presence:true
	validates:date_of_birth,presence:true
	validates:address,presence:true
	validates:city,presence:true
	validates:contactno,presence:true,numericality:{only_integer:true}
	validates:standard_id,presence:true
	
  devise :database_authenticatable, :registerable,:trackable, :validatable, :authentication_keys=>[:enrollment_no]
  def email_required?
  false
	end
end
