module Ipstack
    class CreateIpStack
        def initialize(ip)
            @ip = ip
            @key = ENV['IP_STACK_API_KEY']
        end

        def request_api(url)
            response = Excon.get(
                    url,
                    headers: {
                        'X-RapidAPI-Host' => URI.parse(url).host,
                        'X-RapidAPI-Key' => @key
                    }
                )
            puts response
            return JSON.parse(response.body)
                
            return nil if response.status != 200
        end

        def find_local()
            puts @ip
            request_api(
            "http://api.ipstack.com/#{@ip}?access_key=#{@key}"
            )
        end
    end
end