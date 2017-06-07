class AddNameToVoitures < ActiveRecord::Migration[5.0]
  def change
    add_column :voitures, :name, :string
    add_index :voitures, :name, unique: true
  end
end
