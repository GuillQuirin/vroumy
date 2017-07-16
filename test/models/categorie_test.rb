require 'test_helper'

class CategorieTest < ActiveSupport::TestCase
  test "should not save categorie without name" do 
  	categorie = Categorie.new
  	assert_not categorie.save , "Création de la catégorie sans nom"
  end
end
