require 'test_helper'

class SalesForecastsControllerTest < ActionController::TestCase
  setup do
    @sales_forecast = sales_forecasts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sales_forecasts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sales_forecast" do
    assert_difference('SalesForecast.count') do
      post :create, sales_forecast: { agent: @sales_forecast.agent, area_id: @sales_forecast.area_id, budget_id: @sales_forecast.budget_id, certainty_id: @sales_forecast.certainty_id, company: @sales_forecast.company, condition: @sales_forecast.condition, customer_name: @sales_forecast.customer_name, division: @sales_forecast.division, fixed_date: @sales_forecast.fixed_date, instrument: @sales_forecast.instrument, order_date: @sales_forecast.order_date, person_in_charge: @sales_forecast.person_in_charge, price: @sales_forecast.price, reporting_date: @sales_forecast.reporting_date, segment_id: @sales_forecast.segment_id, service_center_id: @sales_forecast.service_center_id, status_id: @sales_forecast.status_id, visible: @sales_forecast.visible }
    end

    assert_redirected_to sales_forecast_path(assigns(:sales_forecast))
  end

  test "should show sales_forecast" do
    get :show, id: @sales_forecast
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sales_forecast
    assert_response :success
  end

  test "should update sales_forecast" do
    patch :update, id: @sales_forecast, sales_forecast: { agent: @sales_forecast.agent, area_id: @sales_forecast.area_id, budget_id: @sales_forecast.budget_id, certainty_id: @sales_forecast.certainty_id, company: @sales_forecast.company, condition: @sales_forecast.condition, customer_name: @sales_forecast.customer_name, division: @sales_forecast.division, fixed_date: @sales_forecast.fixed_date, instrument: @sales_forecast.instrument, order_date: @sales_forecast.order_date, person_in_charge: @sales_forecast.person_in_charge, price: @sales_forecast.price, reporting_date: @sales_forecast.reporting_date, segment_id: @sales_forecast.segment_id, service_center_id: @sales_forecast.service_center_id, status_id: @sales_forecast.status_id, visible: @sales_forecast.visible }
    assert_redirected_to sales_forecast_path(assigns(:sales_forecast))
  end

  test "should destroy sales_forecast" do
    assert_difference('SalesForecast.count', -1) do
      delete :destroy, id: @sales_forecast
    end

    assert_redirected_to sales_forecasts_path
  end
end
