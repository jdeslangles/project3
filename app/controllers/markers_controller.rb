class MarkersController < ApplicationController
  load_and_authorize_resource
  # GET /markers
  # GET /markers.json
  def index
    @markers = Marker.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @markers }
    end
  end

  # GET /markers/1
  # GET /markers/1.json
  def show
    @marker = Marker.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @marker }
    end
  end

  # GET /markers/new
  # GET /markers/new.json
  def new
    @marker = Marker.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @marker }
    end
  end

  def trip_interface
    @trip  = Trip.new
    @marker = @trip.markers.new
    render :trip_interface
  end

  # GET /markers/1/edit
  def edit
    @marker = Marker.find(params[:id])
  end

  # POST /markers
  # POST /markers.json
  def create
    @trip = current_user.trips.find(params[:trip_id])
    if @trip
      marker = @trip.markers.new params[:marker]
      marker.decode_base64 params[:fileData]
      if marker.save
        render json: marker
      else
        render json: {error: "Something went wrong"}, status: 422
      end
    else
      render json: {error: "Something went wrong"}, status: 422
    end
  end

  # PUT /markers/1
  # PUT /markers/1.json
  def update
    @marker = Marker.find(params[:id])

    respond_to do |format|
      if @marker.update_attributes(params[:marker])
        format.html { redirect_to @marker, notice: 'Marker was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @marker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /markers/1
  # DELETE /markers/1.json
  def destroy
    @marker = Marker.find(params[:id])
    @marker.destroy

    respond_to do |format|
      format.html { redirect_to markers_url }
      format.json { head :no_content }
    end
  end
end
