
require 'resolv'

class Geolocation < ApplicationRecord
    validates :ip, :format => { :with => Resolv::IPv4::Regex }
    validates :latitude, numericality: { greater_than_or_equal_to:  -90, less_than_or_equal_to:  90 }
    validates :longitude, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }
    
    validates_presence_of :ip, :typeip, :continent_code, :continent_name, :country_code, :country_name, :region_code, :region_name, :city, :zip, :latitude, :longitude, :location
    
end
