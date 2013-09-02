class Marker < ActiveRecord::Base
  belongs_to :trip

  attr_accessible :address, :description, :latitude, :longitude, :name, :trip, :photo

  mount_uploader :photo, MarkerPhotoUploader

  validate :photo_size_validation

  geocoded_by :address

  after_validation :geocode, :if => :address_changed?

  class << self
    def search_results query
      self.where(search_query, search: "%#{query}%")
    end

    def search_query
      "LOWER(markers.name) like :search OR LOWER(markers.description) like :search OR LOWER(markers.address) like :search"
    end
  end


  private
  def photo_size_validation
    errors[:photo] << "should be less than 1MB" if photo.size > (1.2).megabyte
  end
end
