class SalesForecastsController < ApplicationController
  before_action :set_sales_forecast, only: [:show, :edit, :update, :destroy]

  # GET /sales_forecasts
  # GET /sales_forecasts.json
  def index
    @sales_forecasts = SalesForecast.all
  end

  # GET /sales_forecasts/1
  # GET /sales_forecasts/1.json
  def show
  end

  # GET /sales_forecasts/new
  def new
    @sales_forecast = SalesForecast.new
  end

  # GET /sales_forecasts/1/edit
  def edit
  end

  # POST /sales_forecasts
  # POST /sales_forecasts.json
  def create
    @sales_forecast = SalesForecast.new(sales_forecast_params)

    respond_to do |format|
      if @sales_forecast.save
        format.html { redirect_to @sales_forecast, notice: 'Sales forecast was successfully created.' }
        format.json { render :show, status: :created, location: @sales_forecast }
      else
        format.html { render :new }
        format.json { render json: @sales_forecast.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales_forecasts/1
  # PATCH/PUT /sales_forecasts/1.json
  def update
    respond_to do |format|
      if @sales_forecast.update(sales_forecast_params)
        format.html { redirect_to @sales_forecast, notice: 'Sales forecast was successfully updated.' }
        format.json { render :show, status: :ok, location: @sales_forecast }
      else
        format.html { render :edit }
        format.json { render json: @sales_forecast.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales_forecasts/1
  # DELETE /sales_forecasts/1.json
  def destroy
    @sales_forecast.destroy
    respond_to do |format|
      format.html { redirect_to sales_forecasts_url, notice: 'Sales forecast was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sales_forecast
      @sales_forecast = SalesForecast.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sales_forecast_params
      params.require(:sales_forecast).permit(:service_center_id, :segment_id, :status_id, :area_id, :company, :division, :customer_name, :instrument, :price, :budget_id, :certainty_id, :reporting_date, :fixed_date, :order_date, :agent, :condition, :person_in_charge, :visible)
    end
end
