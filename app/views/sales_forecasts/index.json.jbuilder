json.array!(@sales_forecasts) do |sales_forecast|
  json.extract! sales_forecast, :id, :service_center_id, :segment_id, :status_id, :area_id, :company, :division, :customer_name, :instrument, :price, :budget_id, :certainty_id, :reporting_date, :fixed_date, :order_date, :agent, :condition, :person_in_charge, :visible
  json.url sales_forecast_url(sales_forecast, format: :json)
end
