class HomeController < ApplicationController

  def home
    hash = {}
    if params[:q]
      query = params[:q].to_s.downcase
      [User, Marker, Trip].each {|model|
        key = model.to_s.pluralize.downcase.to_sym
        hash[key] = model.search_results(query)
      }
      render json: hash.to_json
    else
      render :home
    end
  end

end