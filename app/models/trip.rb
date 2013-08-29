class Trip < ActiveRecord::Base
  belongs_to :user
  has_many :markers

  attr_accessible :cover_photo, :description, :name, :user

  accepts_nested_attributes_for :markers

  def self.search_results query
    self.where('LOWER(name) like :search OR LOWER(description) like :search', search: "%#{query}%")
  end


end
