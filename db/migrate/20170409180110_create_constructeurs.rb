class CreateConstructeurs < ActiveRecord::Migration[5.0]
  def change
    create_table :constructeurs do |t|
      t.string :name

      t.timestamps
    end
  end
end
