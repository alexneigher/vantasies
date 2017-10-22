class AddIsSoldToVan < ActiveRecord::Migration[5.1]
  def change
    add_column :vans, :is_sold, :boolean, default: :false
  end
end
