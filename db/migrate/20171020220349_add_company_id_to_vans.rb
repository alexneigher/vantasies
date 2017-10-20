class AddCompanyIdToVans < ActiveRecord::Migration[5.1]
  def change
    add_reference :vans, :company
  end
end
