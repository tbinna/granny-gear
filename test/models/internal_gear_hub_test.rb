require 'test_helper'

class InternalGearHubTest < ActiveSupport::TestCase
  setup do
    @rohloff_gear_hub = internal_gear_hubs(:rohloff_1x1)
  end

  test "the gear ratio array should contain numeric values" do
    assert_not_nil @rohloff_gear_hub.gear_ratio, "Should not be nil"
    assert @rohloff_gear_hub.gear_ratio.count > 0, "Should have at least one element"
    assert_not @rohloff_gear_hub.gear_ratio.any? { |ratio| !ratio.is_a? Numeric }, "All elements should be Numeric"
  end

  test "calculate the gear ratios with 1 chainring and 1 sprocket should get the same gear ratio array" do
  	actual_ratios = @rohloff_gear_hub.gear_ratios.first[:data]
  	expected_ratios = @rohloff_gear_hub.gear_ratio
	
  	expected_ratios.zip(actual_ratios).each do |expected, actual|
    		assert_same(expected.to_f, actual.to_f)
    end
  end

  test "validate gear ratio should add an error if a ratio is smaller then the min allowed" do
    gear_hub = internal_gear_hubs(:rohloff_1x1_too_small)
    gear_hub.valid?
    assert_equal 1, gear_hub.errors[:gear_ratio].count
  end

  test "validate gear ratio should add an error if a ratio is bigger then the max allowed" do
    gear_hub = internal_gear_hubs(:rohloff_too_big)
    gear_hub.valid?
    assert_equal 1, gear_hub.errors[:gear_ratio].count
  end

  test "validation should add an error if a chainring is bigger then the max allowed" do
    gear_hub = internal_gear_hubs(:rohloff_too_big)
    gear_hub.valid?
    assert_equal 1, gear_hub.errors[:chainring].count
  end

  test "validation should add an error if a sprocket is bigger then the max allowed" do
    gear_hub = internal_gear_hubs(:rohloff_too_big)
    gear_hub.valid?
    assert_equal 1, gear_hub.errors[:sprocket].count
  end

  test "gear range for rohloff 14 speed hub is correct" do
    assert_equal 5.2581, @rohloff_gear_hub.gear_range
  end
end
