require 'rails_helper'

RSpec.describe Geolocation, type: :model do
    describe "geolocation is valid with ipv4 " do
      let (:test_geolocation) { create(:geolocation)}

      it "create geolocation when all variables are presence " do
        expect(test_geolocation).to be_valid
      end
  end

  describe "geolocation is not valid with ipv6" do
    let (:test_geolocation) { create(:geolocation, ip: Faker::Internet.ip_v6_address)}
    it "is not valid with ipv6" do
      expect(test_geolocation).to_not be_valid
    end

  end

  describe "invalid geolocation" do
    let (:test_geolocation) { create(:geolocation, ip: nil ) }
    let (:test_geolocation_one) { create(:geolocation, continent_code: nil)}
    let (:test_geolocation_two) { create(:geolocation, latitude: 99)}
    let (:test_geolocation_three) { create(:geolocation, longitude: - 190)}
    
    it "is not valid without ip" do
      expect(test_geolocation).to_not be_valid
    end

    it "is not valid without other attribute continent_code, etc" do
      expect(test_geolocation_one).to_not be_valid
    end

    it "is not valid with latitude greater than 90 or longitude less than -180" do
      expect(test_geolocation_two).to_not be_valid
      expect(test_geolocation_three).to_not be_valid
    end

  end
end
