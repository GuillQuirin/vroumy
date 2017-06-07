class ChangeDateFormatInEvent < ActiveRecord::Migration[5.0]
  def up
  	change_column :events, :startDate, :datetime
  	change_column :events, :endDate, :datetime
  end

  def down 
  	change_column :events, :startDate, :date
  	change_column :events, :endDate, :date
  end
end
