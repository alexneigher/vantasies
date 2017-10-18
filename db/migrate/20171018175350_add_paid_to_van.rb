class AddPaidToVan < ActiveRecord::Migration[5.1]
  def change
    add_column :vans, :is_paid, :boolean, default: :false
  end
end
