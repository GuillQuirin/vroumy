class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :startDate
      t.datetime :endDate
      t.string :place
      t.integer :rate

      t.timestamps
    end
  end
end