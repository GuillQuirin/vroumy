class CreateUtilisateurs < ActiveRecord::Migration[5.0]
  def change
    create_table :utilisateurs do |t|
      t.string :firstName
      t.string :lastName
      t.string :email
      t.integer :numAddress
      t.string :address
      t.string :city
      t.string :phone
      t.boolean :isActive

      t.timestamps
    end
  end
end
