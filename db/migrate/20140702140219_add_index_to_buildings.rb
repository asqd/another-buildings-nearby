class AddIndexToBuildings < ActiveRecord::Migration
  def change
  	add_index :buildings, [:latitude, :longitude]
  end
end
