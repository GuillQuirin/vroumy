require 'test_helper'

class ConstructeursControllerTest < ActionDispatch::IntegrationTest
  setup do
    @constructeur = constructeurs(:one)
  end

  test "should get index" do
    get constructeurs_url
    assert_response :success
  end

  test "should get new" do
    get new_constructeur_url
    assert_response :success
  end

  test "should create constructeur" do
    assert_difference('Constructeur.count') do
      post constructeurs_url, params: { constructeur: { name: @constructeur.name } }
    end

    assert_redirected_to constructeur_url(Constructeur.last)
  end

  test "should show constructeur" do
    get constructeur_url(@constructeur)
    assert_response :success
  end

  test "should get edit" do
    get edit_constructeur_url(@constructeur)
    assert_response :success
  end

  test "should update constructeur" do
    patch constructeur_url(@constructeur), params: { constructeur: { name: @constructeur.name } }
    assert_redirected_to constructeur_url(@constructeur)
  end

  test "should destroy constructeur" do
    assert_difference('Constructeur.count', -1) do
      delete constructeur_url(@constructeur)
    end

    assert_redirected_to constructeurs_url
  end
end
