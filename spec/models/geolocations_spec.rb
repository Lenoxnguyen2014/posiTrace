require 'rails_helper'

RSpec.describe "Geolocations", type: :model do
  before {build(:user)}
  let(:geolocation) { build :geolocation }

  it "authorized if user valid" do
  end

  it "accept ipv4" do
    expect(geolocation).to be_valid
  end

  it "not accept ipv6" do
    geolocation.ip = Faker::Internet.ip_v6_address
    expect(geolocation)
  end

  it "not valid if ip is empty" do
  end

  it "no valid if ip is random string" do

  end
end
