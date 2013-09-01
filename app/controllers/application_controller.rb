class ApplicationController < ActionController::Base
  protect_from_forgery

  def body_class
    @body_class
  end


end
