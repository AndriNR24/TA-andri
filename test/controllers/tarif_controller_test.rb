require "test_helper"

class TarifControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tarif_index_url
    assert_response :success
  end
end
