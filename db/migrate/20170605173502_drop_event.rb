class DropEvent < ActiveRecord::Migration[5.0]
  def up
  	drop_table :events
  end
end
