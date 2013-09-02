class Trip < ActiveRecord::Base
  belongs_to :user
  has_many :markers, dependent: :destroy

  attr_accessible :cover_photo, :description, :name, :user

  mount_uploader :cover_photo, TripCoverPhotoUploader

  validate :cover_photo_size_validation

  accepts_nested_attributes_for :markers

  class << self
    def search_results query
      where(id: select('trips.id').joins(:markers).where(
        [search_query, Marker.search_query].join(' or '),
        search: "%#{query}%"))
    end

    def search_query
      'LOWER(trips.name) like :search OR LOWER(trips.description) like :search '
    end
  end

  private
  def cover_photo_size_validation
    errors[:cover_photo] << "should be less than 1MB" if cover_photo.size > (1.2).megabyte
  end

end
