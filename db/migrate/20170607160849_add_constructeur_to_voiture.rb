class AddConstructeurToVoiture < ActiveRecord::Migration[5.0]
  def change
    add_reference :voitures, :constructeur, foreign_key: true
  end
end
