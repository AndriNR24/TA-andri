require "test_helper"

class RutesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rute = rutes(:one)
  end

  test "should get index" do
    get rutes_url
    assert_response :success
  end

  test "should get new" do
    get new_rute_url
    assert_response :success
  end

  test "should create rute" do
    assert_difference('Rute.count') do
      post rutes_url, params: { rute: { latitude: @rute.latitude, longitude: @rute.longitude } }
    end

    assert_redirected_to rute_url(Rute.last)
  end

  test "should show rute" do
    get rute_url(@rute)
    assert_response :success
  end

  test "should get edit" do
    get edit_rute_url(@rute)
    assert_response :success
  end

  test "should update rute" do
    patch rute_url(@rute), params: { rute: { latitude: @rute.latitude, longitude: @rute.longitude } }
    assert_redirected_to rute_url(@rute)
  end

  test "should destroy rute" do
    assert_difference('Rute.count', -1) do
      delete rute_url(@rute)
    end

    assert_redirected_to rutes_url
  end
end
