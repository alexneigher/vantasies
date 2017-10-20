class AddCompanyToPhotos < ActiveRecord::Migration[5.1]
  def change
    add_reference :photos, :company
  end
end
