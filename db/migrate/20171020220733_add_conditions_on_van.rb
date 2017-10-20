class AddConditionsOnVan < ActiveRecord::Migration[5.1]
  def change
    remove_column :vans, :condition
    add_column :vans, :condition, :integer, default: 0
  end
end
