require "application_system_test_case"

class AngkutansTest < ApplicationSystemTestCase
  setup do
    @angkutan = angkutans(:one)
  end

  test "visiting the index" do
    visit angkutans_url
    assert_selector "h1", text: "Angkutans"
  end

  test "creating a Angkutan" do
    visit angkutans_url
    click_on "New Angkutan"

    fill_in "Id angkutan", with: @angkutan.id_angkutan
    fill_in "Id trayek", with: @angkutan.id_trayek
    click_on "Create Angkutan"

    assert_text "Angkutan was successfully created"
    click_on "Back"
  end

  test "updating a Angkutan" do
    visit angkutans_url
    click_on "Edit", match: :first

    fill_in "Id angkutan", with: @angkutan.id_angkutan
    fill_in "Id trayek", with: @angkutan.id_trayek
    click_on "Update Angkutan"

    assert_text "Angkutan was successfully updated"
    click_on "Back"
  end

  test "destroying a Angkutan" do
    visit angkutans_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Angkutan was successfully destroyed"
  end
end
