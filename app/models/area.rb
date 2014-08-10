class Area < ActiveRecord::Base
  has_many :sales_forecasts
  has_and_belongs_to_many :service_centers
end
