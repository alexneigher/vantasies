class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
      t.string :title
      t.string :location

      t.boolean :can_deliver, default: :false

      t.text :description

      t.string :make
      t.string :model
      t.string :year

      t.string :condition

      t.string :mileage

      t.string :price

      t.string :transmission

      t.string :vin

      t.string :fuel_type

      t.string :drivetrain

      t.text :features

      t.string :instagram_url

      t.string :website_url
      
      t.timestamps
    end
  end
end
