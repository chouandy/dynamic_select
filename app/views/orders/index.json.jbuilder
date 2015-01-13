json.array!(@orders) do |order|
  json.extract! order, :id, :county_id, :township_id, :total
  json.url order_url(order, format: :json)
end
