class KeywordController < ApplicationController
  def search
    @keywd = params[:keywd]
    @sales_forecasts = SalesForecast.where('
      company LIKE ? OR
      division LIKE ? OR
      customer_name LIKE ? OR
      instrument LIKE ? OR
      agent LIKE ? OR
      condition_text LIKE ?',
      "%#{@keywd}%",
      "%#{@keywd}%",
      "%#{@keywd}%",
      "%#{@keywd}%",
      "%#{@keywd}%",
      "%#{@keywd}%"
      ).order(updated_at: :desc)
  end
end
