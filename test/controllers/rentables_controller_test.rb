require 'test_helper'

class RentablesControllerTest < ActionController::TestCase
  setup do
    @rentable = rentables(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rentables)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rentable" do
    assert_difference('Rentable.count') do
      post :create, rentable: { account_number: @rentable.account_number, admin_id: @rentable.admin_id, city: @rentable.city, inventory: @rentable.inventory, street: @rentable.street, transfer_address: @rentable.transfer_address, transfer_title: @rentable.transfer_title, type: @rentable.type, zip: @rentable.zip }
    end

    assert_redirected_to rentable_path(assigns(:rentable))
  end

  test "should show rentable" do
    get :show, id: @rentable
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rentable
    assert_response :success
  end

  test "should update rentable" do
    patch :update, id: @rentable, rentable: { account_number: @rentable.account_number, admin_id: @rentable.admin_id, city: @rentable.city, inventory: @rentable.inventory, street: @rentable.street, transfer_address: @rentable.transfer_address, transfer_title: @rentable.transfer_title, type: @rentable.type, zip: @rentable.zip }
    assert_redirected_to rentable_path(assigns(:rentable))
  end

  test "should destroy rentable" do
    assert_difference('Rentable.count', -1) do
      delete :destroy, id: @rentable
    end

    assert_redirected_to rentables_path
  end
end
