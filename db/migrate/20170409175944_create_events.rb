class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.date :startDate
      t.date :endDate
      t.string :place
      t.integer :rate

      t.timestamps
    end
  end
end
