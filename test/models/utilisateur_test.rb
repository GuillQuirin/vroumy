require 'test_helper'

class UtilisateurTest < ActiveSupport::TestCase
    test "should not save utilisateur without email" do 
  		utilisateur = Utilisateur.new
  		assert_not utilisateur.save , "Création de l'utilisateur sans email"
  	end

  	test "should not save utilisateur without password" do 
  		utilisateur = Utilisateur.new
  		assert_not utilisateur.save , "Création de l'utilisateur sans mot de passe"
  	end
end
