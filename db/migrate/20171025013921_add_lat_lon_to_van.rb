class AddLatLonToVan < ActiveRecord::Migration[5.1]
  def change
    add_column :vans, :latitude, :decimal, precision: 10, scale: 6
    add_column :vans, :longitude, :decimal,precision: 10, scale: 6

    add_column :companies, :latitude, :decimal, precision: 10, scale: 6
    add_column :companies, :longitude, :decimal,precision: 10, scale: 6
  end
end
