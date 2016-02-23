class Teacher < ActiveRecord::Base
  devise :database_authenticatable,:trackable, :validatable
  validates :first_name, :middle_name, :last_name, :dateofbirth, :address, :city, presence:true
  validates :contactno, presence:true, numericality:{only_integer:true}
  has_attached_file :avatar, :styles => {:original => "150x150"},
  :path => ":rails_root/public/avatars/teachers/:styles/:basename.:extension"
  validates_attachment_presence :avatar
  validates_attachment_size :avatar, :less_than => 300.kilobytes
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png']

  before_post_process :rename_avatar

  private
  def rename_avatar
    extension = File.extname(avatar_file_name).downcase
    self.avatar.instance_write(:file_name, "#{first_name}#{last_name}#{extension}")
  end
end