class RenameListingsVans < ActiveRecord::Migration[5.1]
  def change
    rename_table :listings, :vans
  end
end
