require 'test_helper'

class VoituresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @voiture = voitures(:one)
  end

  test "should get index" do
    get voitures_url
    assert_response :success
  end

  test "should get new" do
    get new_voiture_url
    assert_response :success
  end

  test "should create voiture" do
    assert_difference('Voiture.count') do
      post voitures_url, params: { voiture: { couleur: @voiture.couleur, description: @voiture.description } }
    end

    assert_redirected_to voiture_url(Voiture.last)
  end

  test "should show voiture" do
    get voiture_url(@voiture)
    assert_response :success
  end

  test "should get edit" do
    get edit_voiture_url(@voiture)
    assert_response :success
  end

  test "should update voiture" do
    patch voiture_url(@voiture), params: { voiture: { couleur: @voiture.couleur, description: @voiture.description } }
    assert_redirected_to voiture_url(@voiture)
  end

  test "should destroy voiture" do
    assert_difference('Voiture.count', -1) do
      delete voiture_url(@voiture)
    end

    assert_redirected_to voitures_url
  end

  test "generate_index_route_constructeur" do
    assert_generates "/voitures", controller: "voitures", action: "index"
  end

  test "generate_show_route_constructeur" do
    assert_generates "/voitures/1", { controller: "voitures", action: "show", id: "1" }
  end

  test "generate_edit_route_constructeur" do
    assert_generates "/voitures/1/edit", { controller: "voitures", action: "edit", id: "1" }
  end

  test "generate_destroy_route_constructeur" do
    assert_routing({ method: 'delete', path: '/voitures/1' }, { controller: "voitures", action: "destroy", id: "1" })
  end
end
