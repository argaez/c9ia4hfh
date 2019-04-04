class ChangeTypeCategory < ActiveRecord::Migration[5.0]
  def up
  	change_table :rooms do |t|
  		t.change :price_per_night, :integer
  end
 end

  def down
  	change_table :rooms do |t| 
  	t.change :price_per_night, :decimal 	
  end
 end
end
