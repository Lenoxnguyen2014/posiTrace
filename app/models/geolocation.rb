class Geolocation < ApplicationRecord
    validates_presence_of :ip, :type, :continent_code, :continent_name, :country_code, :country_name, :region_code, :region_name, :city, :zip, :latitude, :longtitude, :location
end
