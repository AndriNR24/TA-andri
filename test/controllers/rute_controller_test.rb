require "test_helper"

class RuteControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get rute_index_url
    assert_response :success
  end
end
