class AddRentableRefToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :rentable, index: true
    add_foreign_key :users, :rentables
  end
end
