require "test_helper"

class LokasisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lokasi = lokasis(:one)
  end

  test "should get index" do
    get lokasis_url
    assert_response :success
  end

  test "should get new" do
    get new_lokasi_url
    assert_response :success
  end

  test "should create lokasi" do
    assert_difference('Lokasi.count') do
      post lokasis_url, params: { lokasi: { id_jalan: @lokasi.id_jalan, id_lokasi: @lokasi.id_lokasi, latitude: @lokasi.latitude, longitude: @lokasi.longitude } }
    end

    assert_redirected_to lokasi_url(Lokasi.last)
  end

  test "should show lokasi" do
    get lokasi_url(@lokasi)
    assert_response :success
  end

  test "should get edit" do
    get edit_lokasi_url(@lokasi)
    assert_response :success
  end

  test "should update lokasi" do
    patch lokasi_url(@lokasi), params: { lokasi: { id_jalan: @lokasi.id_jalan, id_lokasi: @lokasi.id_lokasi, latitude: @lokasi.latitude, longitude: @lokasi.longitude } }
    assert_redirected_to lokasi_url(@lokasi)
  end

  test "should destroy lokasi" do
    assert_difference('Lokasi.count', -1) do
      delete lokasi_url(@lokasi)
    end

    assert_redirected_to lokasis_url
  end
end
