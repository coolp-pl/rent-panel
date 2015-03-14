class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.references :rentable, index: true
      t.references :user, index: true
      t.date :due
      t.boolean :paid
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
    add_foreign_key :invoices, :rentables
    add_foreign_key :invoices, :users
  end
end
