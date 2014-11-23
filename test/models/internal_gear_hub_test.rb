require 'test_helper'

class InternalGearHubTest < ActiveSupport::TestCase
  setup do
    @rohloff_gear_hub = internal_gear_hubs(:rohloff_one_by_one)
  end

  test "calculate the gear ratios with 1 chainring and 1 sprocket should get the same gear ratio array" do
  	actual_ratios = @rohloff_gear_hub.gear_ratios_calculation
  	expected_ratios = @rohloff_gear_hub.gear_ratio.split(",").map { |s| s.to_f }
	
	expected_ratios.zip(actual_ratios).each do |expected, actual|
  		assert_same(expected, actual)
  	end
  end
end
