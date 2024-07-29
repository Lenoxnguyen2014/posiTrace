
require 'resolv'

class Geolocation < ApplicationRecord
    validates :ip, :format => { :with => Resolv::AddressRegex }
    validates_presence_of :ip, :typeip, :continent_code, :continent_name, :country_code, :country_name, :region_code, :region_name, :city, :zip, :latitude, :longitude, :location
    
end
