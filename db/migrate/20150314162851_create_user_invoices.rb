class CreateUserInvoices < ActiveRecord::Migration
  def change
    create_table :user_invoices do |t|
      t.references :invoice, index: true
      t.references :user, index: true
      t.decimal :rent
      t.decimal :trash
      t.decimal :heating
      t.decimal :upkeep
      t.decimal :power
      t.decimal :power_price
      t.float :power_usage
      t.decimal :water
      t.decimal :hot_water_price
      t.float :hot_water_usage
      t.decimal :cold_water_price
      t.float :cold_water_usage
      t.string :other_name
      t.decimal :other_sum

      t.timestamps null: false
    end
    add_foreign_key :user_invoices, :invoices
    add_foreign_key :user_invoices, :users
  end
end
