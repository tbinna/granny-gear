require 'test_helper'

class AnalysisControllerTest < ActionController::TestCase

	test "should get setup" do
		get :setup
		assert_response :success
	end

	test "should end up in RoutingError when accessing result without request parameters" do
		assert_raises ActionController::RoutingError do 
			get :result
		end
	end

end
