class Marker < ActiveRecord::Base
  belongs_to :trip
  has_many :photos, dependent: :destroy

  accepts_nested_attributes_for :photos

  attr_accessible :address, :description, :latitude, :longitude, :name, :trip

  geocoded_by :address

  after_validation :geocode, :if => :address_changed?

  accepts_nested_attributes_for :photos

  class << self
    def search_results query
      self.where(search_query, search: "%#{query}%")
    end

    def search_query
      "LOWER(markers.name) like :search OR LOWER(markers.description) like :search OR LOWER(markers.address) like :search"
    end
  end

end
