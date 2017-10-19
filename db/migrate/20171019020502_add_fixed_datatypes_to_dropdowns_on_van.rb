class AddFixedDatatypesToDropdownsOnVan < ActiveRecord::Migration[5.1]
  def change
    remove_column :vans, :transmission
    add_column :vans, :transmission, :integer
    
    remove_column :vans, :fuel_type
    add_column :vans, :fuel_type, :integer

    remove_column :vans, :drivetrain
    add_column :vans, :drivetrain, :integer

  end
end
