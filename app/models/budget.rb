class Budget < ActiveRecord::Base
  has_many :sales_forecasts
  
  validates :name,
  presence: true
end
