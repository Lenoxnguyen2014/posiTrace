require 'socket'
require "resolv"

module Ipstack
    class CreateIpStack
        def initialize(ip, url)
            @ip = ip
            @url = url
            @key = ENV['IP_STACK_API_KEY']
        end

        def check_ip_valid
            if @ip.present?
                @ip
            elsif @url.present?
                begin
                    @ip = IPSocket.getaddress(@url)
                rescue SocketError => e
                    return false
                end
            end
        end

        def only_accept_ipv4
            @ip =~ Resolv::IPv4::Regex
        end

        def request_api(link)
            response = Excon.get(
                    link,
                    headers: {
                        'X-RapidAPI-Host' => URI.parse(link).host,
                        'X-RapidAPI-Key' => @key
                    }
                )
            return JSON.parse(response.body)
                
            return nil if response.status != 200
        end

        def find_local
            if check_ip_valid.present? && only_accept_ipv4
                request_api(
                    "http://api.ipstack.com/#{@ip}?access_key=#{@key}"
                )
            else
                return nil
            end
        end

    end
end