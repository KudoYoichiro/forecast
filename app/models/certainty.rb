class Certainty < ActiveRecord::Base
  has_many :sales_forecasts
  
  validates :name,
  presence: true,
  numericality: { only_integer: true, less_than_or_equal_to: 100 }
end
