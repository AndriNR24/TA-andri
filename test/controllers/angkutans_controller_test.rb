require "test_helper"

class AngkutansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @angkutan = angkutans(:one)
  end

  test "should get index" do
    get angkutans_url
    assert_response :success
  end

  test "should get new" do
    get new_angkutan_url
    assert_response :success
  end

  test "should create angkutan" do
    assert_difference('Angkutan.count') do
      post angkutans_url, params: { angkutan: { id_angkutan: @angkutan.id_angkutan, id_trayek: @angkutan.id_trayek } }
    end

    assert_redirected_to angkutan_url(Angkutan.last)
  end

  test "should show angkutan" do
    get angkutan_url(@angkutan)
    assert_response :success
  end

  test "should get edit" do
    get edit_angkutan_url(@angkutan)
    assert_response :success
  end

  test "should update angkutan" do
    patch angkutan_url(@angkutan), params: { angkutan: { id_angkutan: @angkutan.id_angkutan, id_trayek: @angkutan.id_trayek } }
    assert_redirected_to angkutan_url(@angkutan)
  end

  test "should destroy angkutan" do
    assert_difference('Angkutan.count', -1) do
      delete angkutan_url(@angkutan)
    end

    assert_redirected_to angkutans_url
  end
end
