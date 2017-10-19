class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.references :van, foreign_key: true
      t.string :reply_to_email
      t.string :name
      t.text :body

      t.timestamps
    end
  end
end
