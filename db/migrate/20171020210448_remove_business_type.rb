class RemoveBusinessType < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :business_type
  end
end
