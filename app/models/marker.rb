class Marker < ActiveRecord::Base
  belongs_to :trip
  has_many :photos, dependent: :destroy

  accepts_nested_attributes_for :photos

  attr_accessible :address, :description, :latitude, :longitude, :name, :trip

  geocoded_by :address

  after_validation :geocode, :if => :address_changed?

  accepts_nested_attributes_for :photos


  def self.search_results query
    self.where('LOWER(name) like :search OR LOWER(description) like :search OR LOWER(address) like :search', search: "%#{query}%")
  end

end
