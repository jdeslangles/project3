class User < ActiveRecord::Base
  has_many :trips
  attr_accessible :bio, :birthdate, :email, :firstname, :lastname, :password_digest, :username
end
