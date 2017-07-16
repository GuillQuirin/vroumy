require 'test_helper'

class UtilisateursControllerTest < ActionDispatch::IntegrationTest
  setup do
    @utilisateur = utilisateurs(:one)
  end

  test "should get index" do
    get utilisateurs_url
    assert_response :success
  end

  test "should get new" do
    get new_utilisateur_url
    assert_response :success
  end

  test "should create utilisateur" do
    assert_difference('Utilisateur.count') do
      post utilisateurs_url, params: { utilisateur: { address: @utilisateur.address, city: @utilisateur.city, email: @utilisateur.email, firstName: @utilisateur.firstName, isActive: @utilisateur.isActive, lastName: @utilisateur.lastName, numAddress: @utilisateur.numAddress, phone: @utilisateur.phone } }
    end

    assert_redirected_to utilisateur_url(Utilisateur.last)
  end

  test "should show utilisateur" do
    get utilisateur_url(@utilisateur)
    assert_response :success
  end

  test "should get edit" do
    get edit_utilisateur_url(@utilisateur)
    assert_response :success
  end

  test "should update utilisateur" do
    patch utilisateur_url(@utilisateur), params: { utilisateur: { address: @utilisateur.address, city: @utilisateur.city, email: @utilisateur.email, firstName: @utilisateur.firstName, isActive: @utilisateur.isActive, lastName: @utilisateur.lastName, numAddress: @utilisateur.numAddress, phone: @utilisateur.phone } }
    assert_redirected_to utilisateur_url(@utilisateur)
  end

  test "should destroy utilisateur" do
    assert_difference('Utilisateur.count', -1) do
      delete utilisateur_url(@utilisateur)
    end

    assert_redirected_to utilisateurs_url
  end

  test "generate_index_route_constructeur" do
    assert_generates "/utilisateurs", controller: "utilisateurs", action: "index"
  end

  test "generate_show_route_constructeur" do
    assert_generates "/utilisateurs/1", { controller: "utilisateurs", action: "show", id: "1" }
  end

  test "generate_edit_route_constructeur" do
    assert_generates "/utilisateurs/1/edit", { controller: "utilisateurs", action: "edit", id: "1" }
  end

  test "generate_destroy_route_constructeur" do
    assert_routing({ method: 'delete', path: '/utilisateurs/1' }, { controller: "utilisateurs", action: "destroy", id: "1" })
  end
end
