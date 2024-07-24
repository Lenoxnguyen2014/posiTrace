require 'ipaddr'

class Geolocation < ApplicationRecord
    validates_presence_of :ip, uniqueness: true
    validates_presence_of :url, uniqueness: true
    validate :ip,  if: :check_valid_params
    validate :url, if: :check_valid_params

    private
    def check_valid_params
        return if :ip.present? ^ :url.present?
        erros.add(:base, 'Specify an ip address or url, not both')
    end

    def check_valid_ip_addr
        IPAddr.new(:ip)
        true
        rescue IPAddr::InvalidAddressError => _error
        errors.add(:base, 'Invalid ip address. Please check your again')
    end
end
