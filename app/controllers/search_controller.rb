class SearchController < ApplicationController
  def index
    if params[:q].blank?
      flash[:notice] = "Nothing matches your search."
    else
      search = params[:q].to_s.downcase
      @trips = Trip.where('LOWER(name) like :search OR LOWER(description) like :search', search: "%#{search}%")
    end
  end

  def search
    index
    render :index
  end
end