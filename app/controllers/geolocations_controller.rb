require 'socket'

class GeolocationsController < ApplicationController
  before_action :set_geolocation, only: %i[ show edit update destroy ]

  # GET /geolocations or /geolocations.json
  def index
    @geolocations = Geolocation.all
  end

  # GET /geolocations/1 or /geolocations/1.json
  def show
    render json: @geolocation
  end

  def all
    @geolocations = Geolocation.all
    render json: @geolocations, status: 200
  end

  # GET /geolocations/new
  def new
    @geolocation = Geolocation.new
  end

  # GET /geolocations/1/edit
  def edit
  end

  # POST /geolocations or /geolocations.json
  def create
    ip = params[:geolocation][:ip]
    url = params[:geolocation][:url]
  
    result = Ipstack::CreateIpStack.new(ip, url).find_local()
    format_result = { 'ip' => result['ip'], 
                      'typeip' => result['type'], 
                      'continent_code' => result['continent_code'], 
                      'continent_name' => result['continent_name'], 
                      'country_code' => result['country_code'], 
                      'country_name' => result['country_name'], 
                      'region_code' => result['country_code'], 
                      'region_name' => result['region_name'],
                      'city' => result['city'],
                      'zip' => result['zip'],
                      'latitude' => result['latitude'],
                      'longtitude' => result['longtitude'],
                      'location' => result['location']
                    }

    @geolocation = Geolocation.new(format_result)

    respond_to do |format|
      if @geolocation.save
        format.html { redirect_to geolocation_url(@geolocation), notice: "Geolocation was successfully created." }
        format.json { render :show, status: :created, location: @geolocation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @geolocation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /geolocations/1 or /geolocations/1.json
  def update
    respond_to do |format|
      if @geolocation.update(geolocation_params)
        format.html { redirect_to geolocation_url(@geolocation), notice: "Geolocation was successfully updated." }
        format.json { render :show, status: :ok, location: @geolocation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @geolocation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /geolocations/1 or /geolocations/1.json
  def destroy
    @geolocation.destroy

    respond_to do |format|
      format.html { redirect_to geolocations_url, notice: "Geolocation was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_geolocation
      @geolocation = Geolocation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def geolocation_params
      params.require(:geolocation).permit(:ip, :url)      
    end


end
