class DropVoiture < ActiveRecord::Migration[5.0]
  def change
  	drop_table :voitures
  end
end
