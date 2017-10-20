class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.text :location
      t.boolean :sells_vans
      t.string :website_url
      t.string :instagram_url
      t.string :phone_number
      t.string :company_email_address
      t.text :description
      t.text :services_offered

      t.timestamps
    end
  end
end
