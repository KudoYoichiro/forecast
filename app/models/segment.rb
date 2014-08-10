class Segment < ActiveRecord::Base
  has_many :sales_forecasts
end
