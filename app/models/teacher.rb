class Teacher < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,:trackable, :validatable,:registerable
	validates:first_name,presence:true
	validates:middle_name,presence:true
	validates:last_name,presence:true
	validates:dateofbirth,presence:true
	validates:address,presence:true
	validates:city,presence:true
	validates:contactno,presence:true,numericality:{only_integer:true}
end
