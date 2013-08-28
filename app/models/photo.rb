class Photo < ActiveRecord::Base
  belongs_to :marker
  attr_accessible :description, :name, :photo_picture, :marker_id






end
