class CreateVoitures < ActiveRecord::Migration[5.0]
  def change
    create_table :voitures do |t|
      t.string :couleur
      t.string :description
      t.string :immatriculation

      t.timestamps
    end
  end
end
