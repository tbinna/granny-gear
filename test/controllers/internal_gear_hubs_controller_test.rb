require 'test_helper'

class InternalGearHubsControllerTest < ActionController::TestCase
  setup do
    @rohloff_gear_hub = internal_gear_hubs(:rohloff_one_by_one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:internal_gear_hubs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create internal_gear_hub" do
    assert_difference('InternalGearHub.count') do
      post :create, internal_gear_hub: @rohloff_gear_hub.attributes
    end

    assert_redirected_to internal_gear_hub_path(assigns(:internal_gear_hub))
  end

  test "should show internal_gear_hub" do
    get :show, id: @rohloff_gear_hub
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rohloff_gear_hub
    assert_response :success
  end

  test "should update internal_gear_hub" do
    patch :update, id: @rohloff_gear_hub, internal_gear_hub: @rohloff_gear_hub.attributes
    assert_redirected_to internal_gear_hub_path(assigns(:internal_gear_hub))
  end

  test "should destroy internal_gear_hub" do
    assert_difference('InternalGearHub.count', -1) do
      delete :destroy, id: @rohloff_gear_hub
    end

    assert_redirected_to internal_gear_hubs_path
  end
end
