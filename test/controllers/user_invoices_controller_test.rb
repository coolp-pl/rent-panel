require 'test_helper'

class UserInvoicesControllerTest < ActionController::TestCase
  setup do
    @user_invoice = user_invoices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_invoices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_invoice" do
    assert_difference('UserInvoice.count') do
      post :create, user_invoice: { cold_water_price: @user_invoice.cold_water_price, cold_water_usage: @user_invoice.cold_water_usage, heating: @user_invoice.heating, hot_water_price: @user_invoice.hot_water_price, hot_water_usage: @user_invoice.hot_water_usage, invoice_id: @user_invoice.invoice_id, other_name: @user_invoice.other_name, other_sum: @user_invoice.other_sum, power: @user_invoice.power, power_price: @user_invoice.power_price, power_usage: @user_invoice.power_usage, rent: @user_invoice.rent, trash: @user_invoice.trash, upkeep: @user_invoice.upkeep, user_id: @user_invoice.user_id, water: @user_invoice.water }
    end

    assert_redirected_to user_invoice_path(assigns(:user_invoice))
  end

  test "should show user_invoice" do
    get :show, id: @user_invoice
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_invoice
    assert_response :success
  end

  test "should update user_invoice" do
    patch :update, id: @user_invoice, user_invoice: { cold_water_price: @user_invoice.cold_water_price, cold_water_usage: @user_invoice.cold_water_usage, heating: @user_invoice.heating, hot_water_price: @user_invoice.hot_water_price, hot_water_usage: @user_invoice.hot_water_usage, invoice_id: @user_invoice.invoice_id, other_name: @user_invoice.other_name, other_sum: @user_invoice.other_sum, power: @user_invoice.power, power_price: @user_invoice.power_price, power_usage: @user_invoice.power_usage, rent: @user_invoice.rent, trash: @user_invoice.trash, upkeep: @user_invoice.upkeep, user_id: @user_invoice.user_id, water: @user_invoice.water }
    assert_redirected_to user_invoice_path(assigns(:user_invoice))
  end

  test "should destroy user_invoice" do
    assert_difference('UserInvoice.count', -1) do
      delete :destroy, id: @user_invoice
    end

    assert_redirected_to user_invoices_path
  end
end
