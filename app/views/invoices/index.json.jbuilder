json.array!(@invoices) do |invoice|
  json.extract! invoice, :id, :rentable_id, :user_id, :due, :paid, :rent, :trash, :heating, :upkeep, :power, :power_price, :power_usage, :water, :hot_water_price, :hot_water_usage, :cold_water_price, :cold_water_usage, :other_name, :other_sum
  json.url invoice_url(invoice, format: :json)
end
