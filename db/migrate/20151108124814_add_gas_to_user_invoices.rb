class AddGasToUserInvoices < ActiveRecord::Migration
  def change
    add_column :user_invoices, :gas_usage, :decimal, default: 0
    add_column :user_invoices, :gas_price, :decimal, default: 0
    add_column :user_invoices, :gas, :decimal, default: 0
  end
end
