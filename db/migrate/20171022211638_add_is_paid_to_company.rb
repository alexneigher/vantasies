class AddIsPaidToCompany < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :is_paid, :boolean, default: :false
    add_column :companies, :stripe_customer_id, :string
  end
end
