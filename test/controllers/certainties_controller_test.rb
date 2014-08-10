require 'test_helper'

class CertaintiesControllerTest < ActionController::TestCase
  setup do
    @certainty = certainties(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:certainties)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create certainty" do
    assert_difference('Certainty.count') do
      post :create, certainty: { name: @certainty.name }
    end

    assert_redirected_to certainty_path(assigns(:certainty))
  end

  test "should show certainty" do
    get :show, id: @certainty
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @certainty
    assert_response :success
  end

  test "should update certainty" do
    patch :update, id: @certainty, certainty: { name: @certainty.name }
    assert_redirected_to certainty_path(assigns(:certainty))
  end

  test "should destroy certainty" do
    assert_difference('Certainty.count', -1) do
      delete :destroy, id: @certainty
    end

    assert_redirected_to certainties_path
  end
end
