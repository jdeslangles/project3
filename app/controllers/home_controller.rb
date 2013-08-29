class HomeController < ApplicationController

  def home
    if params[:q]
      query = params[:q].to_s.downcase
      [User, Marker, Trip].each {|model| instance_variable_set( "@#{model.to_s.pluralize.downcase}", model.search_results(query) ) }
    else
      @trips = @markers = @users =  []
    end
  end

end