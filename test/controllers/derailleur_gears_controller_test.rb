require 'test_helper'

class DerailleurGearsControllerTest < ActionController::TestCase
  setup do
    @mountain_bike = derailleur_gears(:mountain_bike_3x9)
    @singlespeed = derailleur_gears(:singlespeed)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:derailleur_gears)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create derailleur_gear" do
    assert_difference('DerailleurGear.count') do
      post :create, derailleur_gear: @singlespeed.attributes
    end
    assert_redirected_to derailleur_gear_path(assigns(:derailleur_gear))
  end

  test "should show derailleur_gear" do
    get :show, id: @mountain_bike
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mountain_bike
    assert_response :success
  end

  test "should update derailleur_gear" do
    patch :update, id: @mountain_bike, derailleur_gear: @singlespeed.attributes
    assert_redirected_to derailleur_gear_path(assigns(:derailleur_gear))
  end

  test "should destroy derailleur_gear" do
    assert_difference('DerailleurGear.count', -1) do
      delete :destroy, id: @mountain_bike
    end

    assert_redirected_to derailleur_gears_path
  end
end
