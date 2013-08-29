class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  has_many :trips
  attr_accessible :bio, :birthdate, :email, :firstname, :lastname, :password, :password_confirmation, :remember_me, :username
end
