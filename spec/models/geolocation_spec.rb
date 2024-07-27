require 'rails_helper'

RSpec.describe Geolocation, type: :model do
    describe "geolocation is valid with ipv4 " do
      let (:test_geolocation) {create(:geolocation)}

      it "all variables are presence " do
        expect(test_geolocation).to be_valid
      end
      it { is_expected.to validate_presence_of :ip }
  end
  # describe "geolocation is not valid with ipv6" do
  #   let (:test_geolocation) {create(:geolocation, ip: Faker::Internet.ip_v6_address)}
  #   it "return []" do
  #     puts test_geolocation.ip
      
  #   end

  # end

  # describe "ip is a must, return empty if no ip or not valid ip" do
  # end


end
