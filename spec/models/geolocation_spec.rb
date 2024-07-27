require 'rails_helper'

RSpec.describe Geolocation, type: :model do
  
  let (:test_geolocation) {create(:geolocation)}
  describe "geolocation is valid with ipv4 " do
      it "all variables are presence " do
        

        expect(test_geolocation).to be_valid
      end
    
  end
  describe "geolocation is not valid with ipv6" do
  end

  describe "ip is a must, return empty if no ip or not valid ip" do
  end


end
