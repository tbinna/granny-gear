require 'test_helper'

class InternalGearHubTest < ActiveSupport::TestCase
  setup do
    @rohloff_gear_hub = internal_gear_hubs(:rohloff_one_by_one)
  end

  test "calculate the gear ratios with 1 chainring and 1 sprocket should get the same gear ratio array" do
  	actual_ratios = @rohloff_gear_hub.gear_ratios.first[:data]
  	expected_ratios = @rohloff_gear_hub.gear_ratio
	
	expected_ratios.zip(actual_ratios).each do |expected, actual|
  		assert_same(expected.to_f, actual.to_f)
  	end
  end
end
