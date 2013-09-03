class TripsController < ApplicationController
  load_and_authorize_resource

  # GET /trips
  # GET /trips.json
  def index
    @trips = Trip.all
    # @trips = Trip.where(user_id: current_user.id)

    respond_to do |format|
      format.html # index.html.erb
      format.json {
        render json: @trips.to_json(include: :markers)
      }
    end
  end

  # GET /trips/1
  # GET /trips/1.json
  def show
    @trip = Trip.find(params[:id])
    @markers = @trip.markers
    @marker = Marker.new trip: @trip
    respond_to do |format|
      format.html # show.html.erb
      format.json {
        render :json => {
          :trip => @trip,
          :markers => @markers
          }
        }
    end
  end

  # GET /trips/new
  # GET /trips/new.json
  def new
    @trip = Trip.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @trip }
    end
  end


  def trip_interface
    @trip  = Trip.new
    @marker = @trip.markers.new
    render :trip_interface
  end

  # GET /trips/1/edit
  def edit
    @trip = Trip.find(params[:id])
    markers = @trip.markers.where(trip_id: @trip.id)
  end

  # POST /trips
  # POST /trips.json
  def create
    @trip = Trip.new(name: params[:name], description: params[:description])
    @trip.decode_base64 params[:fileData] if params[:fileData]
    @trip.user  =  current_user
    if @trip.save
        render json: @trip
    else
      render json: {error: "something went wrong"}, status: 422
    end
  end

  # PUT /trips/1
  # PUT /trips/1.json
  def update
    @trip = Trip.find(params[:id])

    respond_to do |format|
      if @trip.update_attributes(params[:trip])
        format.html { redirect_to @trip, notice: 'Trip was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trips/1
  # DELETE /trips/1.json
  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy

    respond_to do |format|
      format.html { redirect_to trips_url }
      format.json { head :no_content }
    end
  end
end
