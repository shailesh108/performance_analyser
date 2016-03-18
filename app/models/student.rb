class Student < ActiveRecord::Base
 before_create { generate_token(:auth_token) }
  belongs_to:standard
  has_many :results
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
    true
  end

  before_post_process :rename_avatar

  def rename_avatar
    extension = File.extname(avatar_file_name).downcase
    self.avatar.instance_write(:file_name, "#{first_name}#{last_name}#{extension}")
  end
 pg_search_scope :search_by_standard_name, :against => [:standard_id, :enrollment_no]

 def send_password_reset
  generate_token(:password_reset_token)
  self.password_reset_sent_at = Time.zone.now
  save!
  StudentMailer.password_reset(self).deliver
end

def generate_token(column)
  begin
    self[column] = SecureRandom.urlsafe_base64
  end while Student.exists?(column => self[column])
end
end