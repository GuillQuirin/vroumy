class AddUtilisateurToVoiture < ActiveRecord::Migration[5.0]
  def change
    add_reference :voitures, :type, foreign_key: true
  end
end
