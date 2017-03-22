class CreateVroumies < ActiveRecord::Migration[5.0]
  def change
    create_table :vroumies do |t|
      t.string :name

      t.timestamps
    end
  end
end
