require 'test_helper'

class DerailleurGearsControllerTest < ActionController::TestCase
  setup do
    @derailleur_gear = derailleur_gears(:one)
    @update = {name: "Derailleur Gear Config 3x9 Update", chainring: [19,34,42], cassette: [12,14,16,18,20,22,25,28,32]}
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
      post :create, derailleur_gear: @update
    end
    assert_redirected_to derailleur_gear_path(assigns(:derailleur_gear))
  end

  # ...

  test "should show derailleur_gear" do
    get :show, id: @derailleur_gear
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @derailleur_gear
    assert_response :success
  end

  test "should update derailleur_gear" do
    patch :update, id: @derailleur_gear, derailleur_gear: @update
    assert_redirected_to derailleur_gear_path(assigns(:derailleur_gear))
  end

  # ...

  test "should destroy derailleur_gear" do
    assert_difference('DerailleurGear.count', -1) do
      delete :destroy, id: @derailleur_gear
    end

    assert_redirected_to derailleur_gears_path
  end
end
