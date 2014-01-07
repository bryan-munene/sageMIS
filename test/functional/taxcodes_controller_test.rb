require 'test_helper'

class TaxcodesControllerTest < ActionController::TestCase
  setup do
    @taxcode = taxcodes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:taxcodes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create taxcode" do
    assert_difference('Taxcode.count') do
      post :create, taxcode: { description: @taxcode.description, market_name: @taxcode.market_name, name: @taxcode.name, other_info: @taxcode.other_info, percentage_markup: @taxcode.percentage_markup }
    end

    assert_redirected_to taxcode_path(assigns(:taxcode))
  end

  test "should show taxcode" do
    get :show, id: @taxcode
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @taxcode
    assert_response :success
  end

  test "should update taxcode" do
    put :update, id: @taxcode, taxcode: { description: @taxcode.description, market_name: @taxcode.market_name, name: @taxcode.name, other_info: @taxcode.other_info, percentage_markup: @taxcode.percentage_markup }
    assert_redirected_to taxcode_path(assigns(:taxcode))
  end

  test "should destroy taxcode" do
    assert_difference('Taxcode.count', -1) do
      delete :destroy, id: @taxcode
    end

    assert_redirected_to taxcodes_path
  end
end
