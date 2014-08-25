class KeywordController < ApplicationController
  def search
    per_page = 50
    
    @keywd = params[:keywd]
    @show_all = params[:show_all]
    
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
      
      if @show_all.blank?
        @sales_forecasts.where!(visible: true)
      end

      @paginated_sales_forecasts = paginate(@sales_forecasts, per_page)
  end
end
