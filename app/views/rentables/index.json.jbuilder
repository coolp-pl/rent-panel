json.array!(@rentables) do |rentable|
  json.extract! rentable, :id, :type, :city, :street, :zip, :inventory, :admin_id, :account_number, :transfer_address, :transfer_title
  json.url rentable_url(rentable, format: :json)
end
