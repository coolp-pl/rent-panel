class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.references :rentable, index: true
      t.date :due
      t.boolean :paid

      t.timestamps null: false
    end
    add_foreign_key :invoices, :rentables
  end
end
