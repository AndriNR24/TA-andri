require "application_system_test_case"

class LokasisTest < ApplicationSystemTestCase
  setup do
    @lokasi = lokasis(:one)
  end

  test "visiting the index" do
    visit lokasis_url
    assert_selector "h1", text: "Lokasis"
  end

  test "creating a Lokasi" do
    visit lokasis_url
    click_on "New Lokasi"

    fill_in "Id jalan", with: @lokasi.id_jalan
    fill_in "Id lokasi", with: @lokasi.id_lokasi
    fill_in "Latitude", with: @lokasi.latitude
    fill_in "Longitude", with: @lokasi.longitude
    click_on "Create Lokasi"

    assert_text "Lokasi was successfully created"
    click_on "Back"
  end

  test "updating a Lokasi" do
    visit lokasis_url
    click_on "Edit", match: :first

    fill_in "Id jalan", with: @lokasi.id_jalan
    fill_in "Id lokasi", with: @lokasi.id_lokasi
    fill_in "Latitude", with: @lokasi.latitude
    fill_in "Longitude", with: @lokasi.longitude
    click_on "Update Lokasi"

    assert_text "Lokasi was successfully updated"
    click_on "Back"
  end

  test "destroying a Lokasi" do
    visit lokasis_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Lokasi was successfully destroyed"
  end
end
