json.array!(@indicators) do |indicator|
  json.extract! indicator, :id, :name, :range
  json.url indicator_url(indicator, format: :json)
end
