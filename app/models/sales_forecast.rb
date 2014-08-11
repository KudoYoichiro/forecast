class SalesForecast < ActiveRecord::Base
  belongs_to :service_center
  belongs_to :segment
  belongs_to :status
  belongs_to :area
  belongs_to :budget
  belongs_to :certainty
  
  validates :reporting_date,
  format: { with: /\A[0-9]{4}-[0-9]{2}\z/, allow_blank: true }
  
  validates :fixed_date,
  format: { with: /\A[0-9]{4}-[0-9]{2}\z/, allow_blank: true }
  
  validates :order_date,
  format: { with: /\A[0-9]{4}-[0-9]{2}\z/, allow_blank: true }
end
