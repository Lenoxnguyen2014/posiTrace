require 'Resolv'

class Geolocation < ApplicationRecord
    validates_presence_of :ip, :typeip, :continent_code, :continent_name, :country_code, :region_code, :region_name, :city, :zip, :latitude, :longitude, :location
    validates :ip, :format => { :with => Resolv::AddressRegex }
    attr_reader :ip, :typeip, :continent_code, :continent_name, :country_code, :region_code, :region_name, :city, :zip, :latitude, :longitude, :location

    def initialize(data)
      @ip = data[:ip]
      @typeip = data[:typeip]
      @continent_code = data[:continent_code]
      @continent_name = data[:continent_name]
      @country_code = data[:country_code]
      @region_code = data[:region_code]
      @region_name = data[:region_name]
      @city = data[:city]
      @zip = data[:zip]
      @latitude = data[:latitude]
      @longitude = data[:longitude]
      @location = data[:location]
    end
end
