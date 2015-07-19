class AddPassCodeToRentables < ActiveRecord::Migration
  def change
    add_column :rentables, :pass_code, :string
  end
end
