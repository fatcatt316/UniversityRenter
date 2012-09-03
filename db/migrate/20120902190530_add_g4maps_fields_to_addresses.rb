class AddG4mapsFieldsToAddresses < ActiveRecord::Migration
  def self.up
    add_column :addresses, :latitude,  :float #you can change the name, see wiki
    add_column :addresses, :longitude, :float #you can change the name, see wiki
    add_column :addresses, :gmaps, :boolean #not mandatory, see wiki
  end

  def self.down
    remove_column :addresses, :latitude
    remove_column :addresses, :longitude
    remove_column :addresses, :gmaps
  end
end
