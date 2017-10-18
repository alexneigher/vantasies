class AssociateUsersToListings < ActiveRecord::Migration[5.1]
  def change
    add_reference :listings, :user
  end
end
