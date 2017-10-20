class AddDisplayOrderToPhotos < ActiveRecord::Migration[5.1]
  def change
    add_column :photos, :display_order, :integer, default: 0
  end
end
