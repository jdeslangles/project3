class TripPdf
  def initialize(trip)
    @trip = trip
    @pdf = Prawn::Document.new
  end
  def render
    @pdf.text @trip.name

    @trip.markers.each do |marker|

    end

    @pdf.image open("https://maps.googleapis.com/maps/api/staticmap?center=Brooklyn+Bridge,New+York,NY&zoom=13&size=600x300&maptype=roadmap&markers=color:blue%7Clabel:S%7C40.702147,-74.015794&markers=color:green%7Clabel:G%7C40.711614,-74.012318&markers=color:red%7Clabel:C%7C40.718217,-73.998284&sensor=false")
    @pdf.render
  end
end



# http://maps.googleapis.com/maps/api/staticmap?center=Williamsburg,Brooklyn,NY&zoom=3&size=400x400&markers=color:blue%7Clabel:S%7C11211%7C11206%7C11222&sensor=false&path=color:0x0000ff|weight:5|40.737102,-73.990318|40.749825,-73.987963|40.752946,-73.987384|40.755823,-73.986397