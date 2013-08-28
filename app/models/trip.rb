class Trip < ActiveRecord::Base
  belongs_to :user
  has_many :markers
  attr_accessible :cover_photo, :description, :name
end
