json.array!(@expenses) do |expense|
  json.extract! expense, :id, :issued_at, :description, :total_price, :tax_price
  json.url expense_url(expense, format: :json)
end
