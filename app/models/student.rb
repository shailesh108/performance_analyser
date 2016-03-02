 class Student < ActiveRecord::Base
  belongs_to:standard
  include PgSearch
  validates :first_name, :middle_name, :last_name, :date_of_birth, :address, :city, :contactno, :standard_id, presence:true
  validates :contactno,numericality:{only_integer: true}
  has_attached_file :avatar, :styles => {:original => "150x150"},
  :path => ":rails_root/public/avatars/students/:styles/:basename.:extension"
  validates_attachment_presence :avatar
  validates_attachment_size :avatar, :less_than => 300.kilobytes
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png']

  devise :database_authenticatable, :trackable, :validatable, :authentication_keys=>[:enrollment_no]

  def email_required?
    false
  end

  before_post_process :rename_avatar

  def rename_avatar
    extension = File.extname(avatar_file_name).downcase
    self.avatar.instance_write(:file_name, "#{first_name}#{last_name}#{extension}")
  end
 pg_search_scope :search_by_standard_name, :against => [:standard_id, :enrollment_no]
end