#app/controllers/geolocal_controller.rb
private

def request_api(url)
    response = Excon.get(
        url,
        headers: {
            'X-RapidAPI-Host' => URI.parse(url).host,
            'X-RapidAPI-Key' => ENV.fetch('IP_STACK_API_KEY')
        }
    )
    return nil if response.status != 200
    JSON.parse(response.body)
end

def find_local(ipaddress)
    request_api(
      "http://api.ipstack.com/#{URI.encode(ipaddress)}?access_key=IP_STACK_API_KEY"
    )
  end