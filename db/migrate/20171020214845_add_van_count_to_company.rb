class AddVanCountToCompany < ActiveRecord::Migration[5.1]
  def change
    remove_column :companies, :sells_vans
    add_column :companies, :van_credits, :integer, default: 0
  end
end
