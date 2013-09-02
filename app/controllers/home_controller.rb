class HomeController < ApplicationController

  def home
      render :home
  end

  def search
    hash = {}
    if params[:q]
        render(json: { errors: "Please enter a search term."}, status: :unprocessable_entity) and return if params[:q].blank?

      query = params[:q].to_s.downcase
      [User, Marker, Trip].each {|model|
        key = model.to_s.pluralize.downcase.to_sym
        hash[key] = model.search_results(query)
      }
      if hash.values.map(&:blank?).all?
        render json: { errors: "Nothing matches your search."}, status: :unprocessable_entity
      else
        render json: hash.to_json

      end
    else
      render :home
    end
  end

end