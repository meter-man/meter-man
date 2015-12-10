json.array!(@some_readings) do |reading, cost|
  json.extract! reading, :id, :reading, :reading_date
  json.url reading_url(reading, format: :json)
end
