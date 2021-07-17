require "application_system_test_case"

class RutesTest < ApplicationSystemTestCase
  setup do
    @rute = rutes(:one)
  end

  test "visiting the index" do
    visit rutes_url
    assert_selector "h1", text: "Rutes"
  end

  test "creating a Rute" do
    visit rutes_url
    click_on "New Rute"

    fill_in "Latitude", with: @rute.latitude
    fill_in "Longitude", with: @rute.longitude
    click_on "Create Rute"

    assert_text "Rute was successfully created"
    click_on "Back"
  end

  test "updating a Rute" do
    visit rutes_url
    click_on "Edit", match: :first

    fill_in "Latitude", with: @rute.latitude
    fill_in "Longitude", with: @rute.longitude
    click_on "Update Rute"

    assert_text "Rute was successfully updated"
    click_on "Back"
  end

  test "destroying a Rute" do
    visit rutes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Rute was successfully destroyed"
  end
end
