require "application_system_test_case"

class GeolocationsTest < ApplicationSystemTestCase
  setup do
    @geolocation = geolocations(:one)
  end

  test "visiting the index" do
    visit geolocations_url
    assert_selector "h1", text: "Geolocations"
  end

  test "should create geolocation" do
    visit geolocations_url
    click_on "New geolocation"

    fill_in "Continent code", with: @geolocation.continent_code
    fill_in "Continent name", with: @geolocation.continent_name
    fill_in "Ip", with: @geolocation.ip
    fill_in "Type", with: @geolocation.type
    click_on "Create Geolocation"

    assert_text "Geolocation was successfully created"
    click_on "Back"
  end

  test "should update Geolocation" do
    visit geolocation_url(@geolocation)
    click_on "Edit this geolocation", match: :first

    fill_in "Continent code", with: @geolocation.continent_code
    fill_in "Continent name", with: @geolocation.continent_name
    fill_in "Ip", with: @geolocation.ip
    fill_in "Type", with: @geolocation.type
    click_on "Update Geolocation"

    assert_text "Geolocation was successfully updated"
    click_on "Back"
  end

  test "should destroy Geolocation" do
    visit geolocation_url(@geolocation)
    click_on "Destroy this geolocation", match: :first

    assert_text "Geolocation was successfully destroyed"
  end
end
