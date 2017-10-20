class AddDeletedAtToVans < ActiveRecord::Migration[5.1]
  def change
    add_column :vans, :deleted_at, :datetime, index: :true
  end
end
