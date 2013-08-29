class SearchController < ApplicationController
  def index
    if params[:q].blank?
      flash[:notice] = "Nothing matches your search."
    else
      search = params[:q].to_s.downcase
      @trips = Trip.where('LOWER(name) like :search OR LOWER(description) like :search', search: "%#{search}%")
      @markers = Marker.where('LOWER(name) like :search OR LOWER(description) like :search OR LOWER(address) like :search', search: "%#{search}%")
      @users = User.where('LOWER(firstname) like :search OR LOWER(lastname) like :search OR LOWER(username) like :search OR LOWER(bio) like :search ', search: "%#{search}%")
    end
  end

  def search
    index
    render :index
  end
end