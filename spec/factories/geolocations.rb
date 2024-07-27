# spec/factories/geolocations.rb
FactoryBot.define do
    factory :geolocation do
        ip {Faker::Internet.ip_v4_address}
        typeip {'ipv4'}
    end
end