class SalesForecast < ActiveRecord::Base
  belongs_to :service_center
  belongs_to :segment
  belongs_to :status
  belongs_to :area
  belongs_to :budget
  belongs_to :certainty
end
