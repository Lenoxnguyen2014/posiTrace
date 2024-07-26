require 'Resolv'

class Geolocation < ApplicationRecord
    validates_presence_of :ip, :typeip, :continent_code, :continent_name, :country_code, :region_code, :region_name, :city, :zip, :latitude, :longitude, :location
    validates :ip, :format => { :with => Resolv::AddressRegex }

end
