class AddForSaleTovan < ActiveRecord::Migration[5.1]
  def change
    add_column :vans, :is_for_sale, :boolean, default: :true
  end
end
