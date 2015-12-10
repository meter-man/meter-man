json.array!(@all_readings) do |reading, cost|
  json.extract! reading, :id, :reading, :reading_date
  json.cost cost
  json.url reading_url(reading, format: :json)
end
