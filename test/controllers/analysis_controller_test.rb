require 'test_helper'

class AnalysisControllerTest < ActionController::TestCase

	test "accessing results without request parameters should end up in RoutingError" do
		assert_raises ActionController::RoutingError do 
			get :result
		end
	end

end
