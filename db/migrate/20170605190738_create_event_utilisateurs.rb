class CreateEventUtilisateurs < ActiveRecord::Migration[5.0]
  def change
    create_table :event_utilisateurs do |t|
      t.references :event, foreign_key: true
      t.references :utilisateur, foreign_key: true

      t.timestamps
    end
  end
end
