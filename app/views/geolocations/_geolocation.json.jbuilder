json.extract! geolocation, :id, :ip, :type, :continent_code, :continent_name, :created_at, :updated_at
json.url geolocation_url(geolocation, format: :json)
