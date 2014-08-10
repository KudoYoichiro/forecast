json.array!(@certainties) do |certainty|
  json.extract! certainty, :id, :name
  json.url certainty_url(certainty, format: :json)
end
