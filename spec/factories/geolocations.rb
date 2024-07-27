# spec/factories/geolocations.rb

FactoryBot.define do
    factory :geolocation do
        ip {Faker::Internet.ip_v4_address}
        typeip {'ipv4'}
        continent_code {"NA"}
        continent_name {"North America"}
        country_code {"US"}
        country_name {"United States"}
        region_code {"US"}
        region_name {"California"}
        city {"Santa Rosa"}
        zip {"95403"}
        latitude {8.50281143188476}
        longitude {-122.7535400390625}
        location { {"is_eu": false} }

        skip_create
        initialize_with { new(attributes) }
    end
end
