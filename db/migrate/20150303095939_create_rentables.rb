class CreateRentables < ActiveRecord::Migration
  def change
    create_table :rentables do |t|
      t.integer :type
      t.string :city
      t.string :street
      t.string :zip
      t.text :inventory
      t.references :admin, index: true
      t.string :account_number
      t.string :transfer_address
      t.string :transfer_title

      t.timestamps null: false
    end
    add_foreign_key :rentables, :admins
  end
end
