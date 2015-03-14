require 'test_helper'

class InvoicesControllerTest < ActionController::TestCase
  setup do
    @invoice = invoices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:invoices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create invoice" do
    assert_difference('Invoice.count') do
      post :create, invoice: { cold_water_price: @invoice.cold_water_price, cold_water_usage: @invoice.cold_water_usage, due: @invoice.due, heating: @invoice.heating, hot_water_price: @invoice.hot_water_price, hot_water_usage: @invoice.hot_water_usage, other_name: @invoice.other_name, other_sum: @invoice.other_sum, paid: @invoice.paid, power: @invoice.power, power_price: @invoice.power_price, power_usage: @invoice.power_usage, rent: @invoice.rent, rentable_id: @invoice.rentable_id, trash: @invoice.trash, upkeep: @invoice.upkeep, user_id: @invoice.user_id, water: @invoice.water }
    end

    assert_redirected_to invoice_path(assigns(:invoice))
  end

  test "should show invoice" do
    get :show, id: @invoice
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @invoice
    assert_response :success
  end

  test "should update invoice" do
    patch :update, id: @invoice, invoice: { cold_water_price: @invoice.cold_water_price, cold_water_usage: @invoice.cold_water_usage, due: @invoice.due, heating: @invoice.heating, hot_water_price: @invoice.hot_water_price, hot_water_usage: @invoice.hot_water_usage, other_name: @invoice.other_name, other_sum: @invoice.other_sum, paid: @invoice.paid, power: @invoice.power, power_price: @invoice.power_price, power_usage: @invoice.power_usage, rent: @invoice.rent, rentable_id: @invoice.rentable_id, trash: @invoice.trash, upkeep: @invoice.upkeep, user_id: @invoice.user_id, water: @invoice.water }
    assert_redirected_to invoice_path(assigns(:invoice))
  end

  test "should destroy invoice" do
    assert_difference('Invoice.count', -1) do
      delete :destroy, id: @invoice
    end

    assert_redirected_to invoices_path
  end
end
