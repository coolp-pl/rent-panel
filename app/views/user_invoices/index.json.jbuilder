json.array!(@user_invoices) do |user_invoice|
  json.extract! user_invoice, :id, :invoice_id, :user_id, :rent, :trash, :heating, :upkeep, :power, :power_price, :power_usage, :water, :hot_water_price, :hot_water_usage, :cold_water_price, :cold_water_usage, :other_name, :other_sum
  json.url user_invoice_url(user_invoice, format: :json)
end
