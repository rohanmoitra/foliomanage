require 'test_helper'

class StocksControllerTest < ActionController::TestCase
  setup do
    @stock = stocks(:one)
    @update = {
              :symbol => 'AAPL',
              :name => 'Apple Inc.',
              :holding =>   10,
              :price => 550.15
    }
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stocks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stock" do
    assert_difference('Stock.count') do
      post :create, :stock => @update
    end

    assert_redirected_to stock_path(assigns(:stock))
  end

  test "should show stock" do
    get :show, id: @stock
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stock
    assert_response :success
  end

  test "should update stock" do
    put :update, id: @stock, :stock => @update
    assert_redirected_to stock_path(assigns(:stock))
  end

  test "should destroy stock" do
    assert_difference('Stock.count', -1) do
      delete :destroy, id: @stock
    end

    assert_redirected_to stocks_path
  end
end
