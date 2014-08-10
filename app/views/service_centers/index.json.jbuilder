json.array!(@service_centers) do |service_center|
  json.extract! service_center, :id, :name
  json.url service_center_url(service_center, format: :json)
end
