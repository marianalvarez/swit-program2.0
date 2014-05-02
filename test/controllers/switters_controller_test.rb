require 'test_helper'

class SwittersControllerTest < ActionController::TestCase
  setup do
    @switter = switters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:switters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create switter" do
    assert_difference('Switter.count') do
      post :create, switter: { password: @switter.password, username: @switter.username }
    end

    assert_redirected_to switter_path(assigns(:switter))
  end

  test "should show switter" do
    get :show, id: @switter
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @switter
    assert_response :success
  end

  test "should update switter" do
    patch :update, id: @switter, switter: { password: @switter.password, username: @switter.username }
    assert_redirected_to switter_path(assigns(:switter))
  end

  test "should destroy switter" do
    assert_difference('Switter.count', -1) do
      delete :destroy, id: @switter
    end

    assert_redirected_to switters_path
  end
end
