class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  has_many :trips
  attr_accessible :bio, :birthdate, :email, :firstname, :lastname, :password, :password_confirmation, :remember_me, :username, :avatar, :location


  mount_uploader :avatar, UserAvatarUploader

  validate :avatar_size_validation

  accepts_nested_attributes_for :trips


  private
  def downcase_username
    self.username.downcase! if self.username
  end

  private
  def set_default_role
    self.role ||= 'registered'
  end


  private
  def avatar_size_validation
    errors[:avatar] << "should be less than 1MB" if avatar.size > (1.2).megabyte


  end















end
