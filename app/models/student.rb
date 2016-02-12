class Student < ActiveRecord::Base
	belongs_to :standard
validates:enrollment_no,presence:true,uniqueness:true
	validates:first_name,presence:true
	validates:last_name,presence:true
	validates:date_of_birth,presence:true
	validates:address,presence:true
	validates:city,presence:true
	validates:contactno,presence:true,numericality:{only_integer:true}
	validates:standard_id,presence:true
	validates:enrollment_no,presence:true,length:{is:12}
	validates:password,confirmation:true,presence:true
	validates:password_confirmation,presence:true
end
