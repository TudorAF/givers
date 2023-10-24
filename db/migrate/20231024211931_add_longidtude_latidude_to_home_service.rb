class AddLongidtudeLatidudeToHomeService < ActiveRecord::Migration[7.0]
  def change
    add_column :home_services, :longitude, :float
    add_column :home_services, :latitude, :float
  end
end
