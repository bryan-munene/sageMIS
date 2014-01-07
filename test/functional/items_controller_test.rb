require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  setup do
    @item = items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item" do
    assert_difference('Item.count') do
      post :create, item: { adjusted_price: @item.adjusted_price, buying_price: @item.buying_price, calculated_selling: @item.calculated_selling, custom_attribute: @item.custom_attribute, custom_size: @item.custom_size, item_attribute: @item.item_attribute, item_code: @item.item_code, item_name: @item.item_name, markup: @item.markup, size: @item.size, source: @item.source, tax_class: @item.tax_class, warehouse: @item.warehouse }
    end

    assert_redirected_to item_path(assigns(:item))
  end

  test "should show item" do
    get :show, id: @item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item
    assert_response :success
  end

  test "should update item" do
    put :update, id: @item, item: { adjusted_price: @item.adjusted_price, buying_price: @item.buying_price, calculated_selling: @item.calculated_selling, custom_attribute: @item.custom_attribute, custom_size: @item.custom_size, item_attribute: @item.item_attribute, item_code: @item.item_code, item_name: @item.item_name, markup: @item.markup, size: @item.size, source: @item.source, tax_class: @item.tax_class, warehouse: @item.warehouse }
    assert_redirected_to item_path(assigns(:item))
  end

  test "should destroy item" do
    assert_difference('Item.count', -1) do
      delete :destroy, id: @item
    end

    assert_redirected_to items_path
  end
end
