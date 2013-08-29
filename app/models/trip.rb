class Trip < ActiveRecord::Base
  belongs_to :user
  has_many :markers

  attr_accessible :cover_photo, :description, :name, :user

  mount_uploader :cover_photo, TripCoverPhotoUploader

  validate :cover_photo_size_validation

  accepts_nested_attributes_for :markers

  def self.search_results query
    self.where('LOWER(name) like :search OR LOWER(description) like :search', search: "%#{query}%")
  end

  private
  def cover_photo_size_validation
    errors[:cover_photo] << "should be less than 1MB" if cover_photo.size > (1.2).megabyte
  end

end
