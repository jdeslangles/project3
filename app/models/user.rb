class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

  before_validation :downcase_username
  before_validation :set_default_role

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  has_many :trips, dependent: :destroy
  has_many :markers, through: :trips, dependent: :destroy
  attr_accessible :bio, :birthdate, :email, :firstname, :lastname, :password, :password_confirmation, :remember_me, :username, :avatar, :location

  mount_uploader :avatar, UserAvatarUploader

  validate :avatar_size_validation

  validates :firstname, presence: true, length:{minimum:2}
  validates :lastname, presence: true, length:{minimum:2}
  validates :username, presence: true, uniqueness: true, length:{maximum:15}

  accepts_nested_attributes_for :trips

  class << self
    def search_results query
      where(id: select('users.id').joins(:trips).joins(:markers).where(
        [search_query, Trip.search_query, Marker.search_query].join(' or '),
        search: "%#{query}%"))
    end

    def search_query
      'LOWER(users.firstname) like :search OR LOWER(users.lastname) like :search OR LOWER(users.username) like :search OR LOWER(users.bio) like :search'
    end
  end

  def role?(role)
    self.role == role
  end

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
