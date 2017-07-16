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
    assert_equal "Le constructeur #{@constructeur.name} a bien été créé.", flash[:notice]
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
    assert_equal "Le constructeur #{@constructeur.name} a bien été mis à jour.", flash[:notice]
  end

  test "should destroy constructeur" do
    assert_difference('Constructeur.count', -1) do
      delete constructeur_url(@constructeur)
    end

    assert_redirected_to constructeurs_url
    assert_equal "Le constructeur #{@constructeur.name} a bien été supprimé.", flash[:notice]
  end

  test "generate_index_route_constructeur" do
    assert_generates "/constructeurs", controller: "constructeurs", action: "index"
  end

  test "generate_show_route_constructeur" do
    assert_generates "/constructeurs/1", { controller: "constructeurs", action: "show", id: "1" }
  end

  test "generate_edit_route_constructeur" do
    assert_generates "/constructeurs/1/edit", { controller: "constructeurs", action: "edit", id: "1" }
  end

  test "generate_destroy_route_constructeur" do
    assert_routing({ method: 'delete', path: '/constructeurs/1' }, { controller: "constructeurs", action: "destroy", id: "1" })
  end
end
