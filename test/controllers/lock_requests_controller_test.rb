require 'test_helper'

class LockRequestsControllerTest < ActionController::TestCase
  setup do
    @lock_request = lock_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lock_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lock_request" do
    assert_difference('LockRequest.count') do
      post :create, lock_request: { isLocked: @lock_request.isLocked, user: @lock_request.user, willLock: @lock_request.willLock }
    end

    assert_redirected_to lock_request_path(assigns(:lock_request))
  end

  test "should show lock_request" do
    get :show, id: @lock_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lock_request
    assert_response :success
  end

  test "should update lock_request" do
    patch :update, id: @lock_request, lock_request: { isLocked: @lock_request.isLocked, user: @lock_request.user, willLock: @lock_request.willLock }
    assert_redirected_to lock_request_path(assigns(:lock_request))
  end

  test "should destroy lock_request" do
    assert_difference('LockRequest.count', -1) do
      delete :destroy, id: @lock_request
    end

    assert_redirected_to lock_requests_path
  end
end
