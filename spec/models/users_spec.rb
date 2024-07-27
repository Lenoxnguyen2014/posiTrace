require 'rails_helper'
RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  
  describe 'valid user' do
    it "create user sucessfully" do
      expect(user).to be_valid
    end

    it "login successfully" do
        login_as user
        
    end
  end
  # it "not accept ipv6" do
  #   geolocation.ip = Faker::Internet.ip_v6_address
  #   expect(@geolocation)
  # end

  # it "not valid if ip is empty" do
  # end

  # it "no valid if ip is random string" do

  # end
end
