require 'test_helper'

class AnalysisSetupControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
