require "test_helper"

class JalansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @jalan = jalans(:one)
  end

  test "should get index" do
    get jalans_url
    assert_response :success
  end

  test "should get new" do
    get new_jalan_url
    assert_response :success
  end

  test "should create jalan" do
    assert_difference('Jalan.count') do
      post jalans_url, params: { jalan: { id_jalan: @jalan.id_jalan, latitude: @jalan.latitude, longitude: @jalan.longitude, nama_jalan: @jalan.nama_jalan } }
    end

    assert_redirected_to jalan_url(Jalan.last)
  end

  test "should show jalan" do
    get jalan_url(@jalan)
    assert_response :success
  end

  test "should get edit" do
    get edit_jalan_url(@jalan)
    assert_response :success
  end

  test "should update jalan" do
    patch jalan_url(@jalan), params: { jalan: { id_jalan: @jalan.id_jalan, latitude: @jalan.latitude, longitude: @jalan.longitude, nama_jalan: @jalan.nama_jalan } }
    assert_redirected_to jalan_url(@jalan)
  end

  test "should destroy jalan" do
    assert_difference('Jalan.count', -1) do
      delete jalan_url(@jalan)
    end

    assert_redirected_to jalans_url
  end
end
