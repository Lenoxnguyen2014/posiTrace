module Ipstack
    class CreateIpStack
        def initialize(ip, url)
            @ip = ip
            @url = url
            @key = ENV['IP_STACK_API_KEY']
        end

        def check_geolocation_valid
            if @ip.present?
                true
            elsif @url.present?
                @ip = IPSocket.getaddress(@url)
            end
            false
        end

        def request_api(url)
            response = Excon.get(
                    url,
                    headers: {
                        'X-RapidAPI-Host' => URI.parse(url).host,
                        'X-RapidAPI-Key' => @key
                    }
                )
            return JSON.parse(response.body)
                
            return nil if response.status != 200
        end

        def find_local
            if check_geolocation_valid
                request_api(
                    "http://api.ipstack.com/#{@ip}?access_key=#{@key}"
                )
            end
        end

    end
end