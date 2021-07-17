require "application_system_test_case"

class JalansTest < ApplicationSystemTestCase
  setup do
    @jalan = jalans(:one)
  end

  test "visiting the index" do
    visit jalans_url
    assert_selector "h1", text: "Jalans"
  end

  test "creating a Jalan" do
    visit jalans_url
    click_on "New Jalan"

    fill_in "Id jalan", with: @jalan.id_jalan
    fill_in "Latitude", with: @jalan.latitude
    fill_in "Longitude", with: @jalan.longitude
    fill_in "Nama jalan", with: @jalan.nama_jalan
    click_on "Create Jalan"

    assert_text "Jalan was successfully created"
    click_on "Back"
  end

  test "updating a Jalan" do
    visit jalans_url
    click_on "Edit", match: :first

    fill_in "Id jalan", with: @jalan.id_jalan
    fill_in "Latitude", with: @jalan.latitude
    fill_in "Longitude", with: @jalan.longitude
    fill_in "Nama jalan", with: @jalan.nama_jalan
    click_on "Update Jalan"

    assert_text "Jalan was successfully updated"
    click_on "Back"
  end

  test "destroying a Jalan" do
    visit jalans_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Jalan was successfully destroyed"
  end
end
