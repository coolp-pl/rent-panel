class AddTransferPersonToRentables < ActiveRecord::Migration
  def change
    add_column :rentables, :transfer_person, :string
  end
end
