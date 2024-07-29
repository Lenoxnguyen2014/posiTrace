 require 'rails_helper'

RSpec.shared_context :login_user do
    let(:user) { create(:user) }
    before { sign_in user }
end

RSpec.describe "Geolocations", type: :request do
  let(:user) { create(:user) }
  include_context :login_user

  describe "empty before sending any requests" do
    it "user can navigate to geolocations" do
        geolocations = Geolocation.all
        
        get "/all"
        expect(response).to have_http_status(200)
        expect(geolocations).to be_empty

      end
  end

  describe "send requests geolocations" do
    let(:geolocation) { create(:geolocation) }

    it "POST /create" do
        expect {
            post "/geolocations", params: { geolocation: {ip: Faker::Internet::ip_v4_address} }
    }.to change(Geolocation, :count).by(1)
    expect(response).to redirect_to(geolocation_url(Geolocation.last))

    end

    it "GET /show" do
        get "/geolocations", params: { geolocation: {ip: geolocation.ip} }
        expect(response).to be_successful
    end

    it "GET /new" do
        get new_geolocation_url
        expect(response).to be_successful
    end

    it "GET /all" do
        get "/all"
        expect(response).to be_successful
    end

    # Need to fix env set up to get this work
    # it "UPDATE /geolocations/:id" do
    #     geolocation = create(:geolocation)
    #     geolocation = Geolocation.last!

    #     put "/geolocations/#{id}", params: {geolocation: {ip: Faker::Internet.ip_v4_address }, id: geolocation.id}
    #     expect(response).to be_successful
    # end

    # it "DESTROY /geolocations/:id" do
    #     first_geolocation = Geolocation.first!
    #     id = first_geolocation.id
    #     delete "/geolocations/#{id}", params: {geolocation: {ip: new_geolocation.ip }}
    #     expect(response).to be_successful
    #     end
    
    end
end
