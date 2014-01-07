require 'test_helper'

class ChangeTypesControllerTest < ActionController::TestCase
  setup do
    @change_type = change_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:change_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create change_type" do
    assert_difference('ChangeType.count') do
      post :create, change_type: { description: @change_type.description, name: @change_type.name }
    end

    assert_redirected_to change_type_path(assigns(:change_type))
  end

  test "should show change_type" do
    get :show, id: @change_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @change_type
    assert_response :success
  end

  test "should update change_type" do
    put :update, id: @change_type, change_type: { description: @change_type.description, name: @change_type.name }
    assert_redirected_to change_type_path(assigns(:change_type))
  end

  test "should destroy change_type" do
    assert_difference('ChangeType.count', -1) do
      delete :destroy, id: @change_type
    end

    assert_redirected_to change_types_path
  end
end
