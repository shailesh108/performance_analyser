class Student < ActiveRecord::Base
	belongs_to:standard
	validates:first_name,presence:true
	validates:middle_name,presence:true
	validates:last_name,presence:true
	validates:date_of_birth,presence:true
	validates:address,presence:true
	validates:city,presence:true
	validates:contactno,presence:true,numericality:{only_integer:true}
	validates:standard_id,presence:true


	devise :database_authenticatable, :trackable, :validatable, :authentication_keys=>[:enrollment_no]
	def email_required?
		false
	end


	has_attached_file :avatar, :styles => {:original => "150x150"},
	:path => ":rails_root/public/avatars/students/:styles/:basename.:extension"

	validates_attachment_presence :avatar
	validates_attachment_size :avatar, :less_than => 300.kilobytes
	validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png']

	before_post_process :rename_avatar

	def rename_avatar
		extension = File.extname(avatar_file_name).downcase
		self.avatar.instance_write(:file_name, "#{first_name}#{last_name}#{extension}")
	end
end
