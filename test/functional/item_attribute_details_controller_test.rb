require 'test_helper'

class ItemAttributeDetailsControllerTest < ActionController::TestCase
  setup do
    @item_attribute_detail = item_attribute_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:item_attribute_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item_attribute_detail" do
    assert_difference('ItemAttributeDetail.count') do
      post :create, item_attribute_detail: { attribute_id: @item_attribute_detail.attribute_id, item_id: @item_attribute_detail.item_id, value: @item_attribute_detail.value }
    end

    assert_redirected_to item_attribute_detail_path(assigns(:item_attribute_detail))
  end

  test "should show item_attribute_detail" do
    get :show, id: @item_attribute_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item_attribute_detail
    assert_response :success
  end

  test "should update item_attribute_detail" do
    put :update, id: @item_attribute_detail, item_attribute_detail: { attribute_id: @item_attribute_detail.attribute_id, item_id: @item_attribute_detail.item_id, value: @item_attribute_detail.value }
    assert_redirected_to item_attribute_detail_path(assigns(:item_attribute_detail))
  end

  test "should destroy item_attribute_detail" do
    assert_difference('ItemAttributeDetail.count', -1) do
      delete :destroy, id: @item_attribute_detail
    end

    assert_redirected_to item_attribute_details_path
  end
end
