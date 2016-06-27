json.array!(@stocks) do |stock|
  json.extract! stock, :id, :symbol, :price, :date, :low_day, :high_day, :volume
  json.url stock_url(stock, format: :json)
end
