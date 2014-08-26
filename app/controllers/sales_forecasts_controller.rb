class SalesForecastsController < ApplicationController
  before_action :set_sales_forecast, only: [:show, :edit, :update, :destroy]
  before_action :set_associations, only: [:new, :edit, :create]

  # GET /sales_forecasts
  # GET /sales_forecasts.json
  def index
    per_page = 50
    
    @service_centers = ServiceCenter.all
    @show_all = params[:show_all]
    @sc = params[:sc]
    @status = params[:status]
    @segment = params[:segment]
    
    @sales_forecasts = select_sales_forecasts_with_sorting
    
    @paginated_sales_forecasts = paginate(@sales_forecasts, per_page)
  end

  # GET /sales_forecasts/1
  # GET /sales_forecasts/1.json
  def show
  end

  # GET /sales_forecasts/new
  def new
    @sales_forecast = SalesForecast.new
    @sales_forecast.visible = true
    @sc = params[:sc]

    unless params[:sc].blank?
      service_center = ServiceCenter.find(params[:sc])
      @selected_area_id = service_center.areas.blank? ? nil : service_center.areas.first.id
    else
      @selected_area_id = nil
    end
  end

  # GET /sales_forecasts/1/edit
  def edit
    @sc = @sales_forecast.service_center.id unless @sales_forecast.service_center.blank?
    @selected_area_id = @sales_forecast.area.id unless @sales_forecast.area.blank?
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
  
  def download
    @sales_forecasts = select_sales_forecasts
    @sales_forecasts.order!(service_center_id: :asc)
    @sales_forecasts.order!(segment_id: :asc)
    @sales_forecasts.order!(status_id: :asc)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sales_forecast
      @sales_forecast = SalesForecast.find(params[:id])
    end
    
    def select_sales_forecasts
      if params[:show_all].blank?
        sales_forecasts = SalesForecast.where(visible: true)
        unless params[:sc].blank?
          sales_forecasts.where!(service_center_id: params[:sc])
        end
        if !params[:status].blank?
          sales_forecasts.where!(status_id: params[:status])
        elsif !params[:segment].blank?
          sales_forecasts.where!(segment_id: params[:segment])
        end
      else
        if params[:sc].blank?
          sales_forecasts = SalesForecast.all
        else
          sales_forecasts = SalesForecast.where(service_center_id: params[:sc])
        end
        if !params[:status].blank?
          sales_forecasts.where!(status_id: params[:status])
        elsif !params[:segment].blank?
          sales_forecasts.where!(segment_id: params[:segment])
        end
      end
      
      return sales_forecasts
    end
    
    def select_sales_forecasts_with_sorting
      sales_forecasts = select_sales_forecasts
      
      if params[:sort_in].blank?
        @sort_in = :desc
      # ページングするときは、ソートの方向を維持する
      elsif !params[:page].blank?
        @sort_in = params[:sort_in].to_sym
      else
        @sort_in = params[:sort_in].to_sym == :asc ? :desc : :asc
      end
       
      @sort_by = params[:sort_by]
      case @sort_by
      when "service_center"
        sales_forecasts.order!(service_center_id: @sort_in)
      when "segment"
        sales_forecasts.order!(segment_id: @sort_in)
      when "status"
        sales_forecasts.order!(status_id: @sort_in)
      when "area"
        sales_forecasts.order!(area_id: @sort_in)
      when "company"
        sales_forecasts.order!(company: @sort_in)
      when "division"
        sales_forecasts.order!(division: @sort_in)
      when "customer_name"
        sales_forecasts.order!(customer_name: @sort_in)
      when "instrument"
        sales_forecasts.order!(instrument: @sort_in)
      when "price"
        sales_forecasts.order!(price: @sort_in)
      when "budget"
        sales_forecasts.order!(budget_id: @sort_in)
      when "certainty"
        sales_forecasts.order!(certainty_id: @sort_in)
      when "reporting_date"
        sales_forecasts.order!(reporting_date: @sort_in)
      when "fixed_date"
        sales_forecasts.order!(fixed_date: @sort_in)
      when "order_date"
        sales_forecasts.order!(order_date: @sort_in)
      when "agent"
        sales_forecasts.order!(agent: @sort_in)
      when "condition_text"
        sales_forecasts.order!(condition_text: @sort_in)
      when "person_in_charge"
        sales_forecasts.order!(person_in_charge: @sort_in)
      when "updated_at"
        sales_forecasts.order!(updated_at: @sort_in)
      else
        sales_forecasts.order!(updated_at: :desc)
      end
      
      return sales_forecasts
    end

    def set_associations
      @service_centers = ServiceCenter.all
      @segments = Segment.all
      @statuses = Status.all
      @areas = Area.all
      @budgets = Budget.all
      @certainties = Certainty.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sales_forecast_params
      params.require(:sales_forecast).permit(:service_center_id, :segment_id, :status_id, :area_id, :company, :division, :customer_name, :instrument, :price, :budget_id, :certainty_id, :reporting_date, :fixed_date, :order_date, :agent, :condition_text, :person_in_charge, :visible)
    end
end
