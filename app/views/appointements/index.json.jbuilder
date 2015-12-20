json.array!(@appointements) do |appointement|
  json.extract! appointement, :id, :references, :description
  json.url appointement_url(appointement, format: :json)
end
