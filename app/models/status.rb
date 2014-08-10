class Status < ActiveRecord::Base
  has_many :sales_forecasts
end
