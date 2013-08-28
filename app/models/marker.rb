class Marker < ActiveRecord::Base
  belongs_to :trip
  attr_accessible :address, :description, :latitude, :longitude, :name, :trip
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

end
