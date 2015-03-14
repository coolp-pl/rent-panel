json.array!(@invoices) do |invoice|
  json.extract! invoice, :id, :rentable_id, :due, :paid
  json.url invoice_url(invoice, format: :json)
end
