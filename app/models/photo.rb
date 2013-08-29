class Photo < ActiveRecord::Base
  belongs_to :marker
  attr_accessible :description, :name, :photo_picture, :marker_id

  mount_uploader :photo_picture, PhotoPictureUploader

  validates :photo_picture, presence: true

  validate :photo_picture_size_validation


  private
  def photo_picture_size_validation
    errors[:photo_picture, "Photo"] << "should be less than 1MB" if photo_picture.size > (1.2).megabyte
  end



end
