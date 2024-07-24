module Ipstack
    class CreateIpStack
        def initialize(ip, url)
            @ip = ip
            @url = url
            @key = ENV['IP_STACK_API_KEY']
        end

        def check_geolocation_valid
            if @ip.present?
                @ip
            elsif @url.present?
                @ip = IPSocket.getaddress(@url)
            end
        end

        def request_api(link)
            response = Excon.get(
                    link,
                    headers: {
                        'X-RapidAPI-Host' => URI.parse(link).host,
                        'X-RapidAPI-Key' => @key
                    }
                )
            puts response
            return JSON.parse(response.body)
                
            return nil if response.status != 200
        end

        def find_local
            # if check_geolocation_valid.present?
                request_api(
                    "http://api.ipstack.com/#{@ip}?access_key=#{@key}"
                )
        end

    end
end