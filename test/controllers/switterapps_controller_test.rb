require 'test_helper'

class SwitterappsControllerTest < ActionController::TestCase
  setup do
    @switterapp = switterapps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:switterapps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create switterapp" do
    assert_difference('Switterapp.count') do
      post :create, switterapp: { password: @switterapp.password, username: @switterapp.username }
    end

    assert_redirected_to switterapp_path(assigns(:switterapp))
  end

  test "should show switterapp" do
    get :show, id: @switterapp
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @switterapp
    assert_response :success
  end

  test "should update switterapp" do
    patch :update, id: @switterapp, switterapp: { password: @switterapp.password, username: @switterapp.username }
    assert_redirected_to switterapp_path(assigns(:switterapp))
  end

  test "should destroy switterapp" do
    assert_difference('Switterapp.count', -1) do
      delete :destroy, id: @switterapp
    end

    assert_redirected_to switterapps_path
  end
end
