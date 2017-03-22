require 'test_helper'

class VroumiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vroumy = vroumies(:one)
  end

  test "should get index" do
    get vroumies_url
    assert_response :success
  end

  test "should get new" do
    get new_vroumy_url
    assert_response :success
  end

  test "should create vroumy" do
    assert_difference('Vroumy.count') do
      post vroumies_url, params: { vroumy: { name: @vroumy.name } }
    end

    assert_redirected_to vroumy_url(Vroumy.last)
  end

  test "should show vroumy" do
    get vroumy_url(@vroumy)
    assert_response :success
  end

  test "should get edit" do
    get edit_vroumy_url(@vroumy)
    assert_response :success
  end

  test "should update vroumy" do
    patch vroumy_url(@vroumy), params: { vroumy: { name: @vroumy.name } }
    assert_redirected_to vroumy_url(@vroumy)
  end

  test "should destroy vroumy" do
    assert_difference('Vroumy.count', -1) do
      delete vroumy_url(@vroumy)
    end

    assert_redirected_to vroumies_url
  end
end
