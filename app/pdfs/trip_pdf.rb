class TripPdf
  def initialize(trip)
    @trip = trip
    @trip = Prawn::Document.new
  end
  def render
    @trip.text "Hello!"
    @trip.render
  end
end