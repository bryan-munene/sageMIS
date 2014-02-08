require 'test_helper'

class ItemattributesControllerTest < ActionController::TestCase
  setup do
    @itemattribute = itemattributes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:itemattributes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create itemattribute" do
    assert_difference('Itemattribute.count') do
      post :create, itemattribute: { description: @itemattribute.description, name: @itemattribute.name }
    end

    assert_redirected_to itemattribute_path(assigns(:itemattribute))
  end

  test "should show itemattribute" do
    get :show, id: @itemattribute
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @itemattribute
    assert_response :success
  end

  test "should update itemattribute" do
    put :update, id: @itemattribute, itemattribute: { description: @itemattribute.description, name: @itemattribute.name }
    assert_redirected_to itemattribute_path(assigns(:itemattribute))
  end

  test "should destroy itemattribute" do
    assert_difference('Itemattribute.count', -1) do
      delete :destroy, id: @itemattribute
    end

    assert_redirected_to itemattributes_path
  end
end
