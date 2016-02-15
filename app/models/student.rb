class Student < ActiveRecord::Base
	belongs_to:standard
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,:trackable, :validatable, :authentication_keys=>[:enrollment_no]

  def email_required?
  false
	end
end
