require 'test_helper'

class BackuplogsControllerTest < ActionController::TestCase
  setup do
    @backuplog = backuplogs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:backuplogs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create backuplog" do
    assert_difference('Backuplog.count') do
      post :create, backuplog: { backup_log_date: @backuplog.backup_log_date, days_pending: @backuplog.days_pending, start_date: @backuplog.start_date, status: @backuplog.status, user_id: @backuplog.user_id }
    end

    assert_redirected_to backuplog_path(assigns(:backuplog))
  end

  test "should show backuplog" do
    get :show, id: @backuplog
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @backuplog
    assert_response :success
  end

  test "should update backuplog" do
    put :update, id: @backuplog, backuplog: { backup_log_date: @backuplog.backup_log_date, days_pending: @backuplog.days_pending, start_date: @backuplog.start_date, status: @backuplog.status, user_id: @backuplog.user_id }
    assert_redirected_to backuplog_path(assigns(:backuplog))
  end

  test "should destroy backuplog" do
    assert_difference('Backuplog.count', -1) do
      delete :destroy, id: @backuplog
    end

    assert_redirected_to backuplogs_path
  end
end
