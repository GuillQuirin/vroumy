require 'test_helper'

class ConstructeurTest < ActiveSupport::TestCase
  test "should not save constructeur without name" do 
  	constructeur = Constructeur.new
  	assert_not constructeur.save , "Création du constructeur sans nom"
  end
end
