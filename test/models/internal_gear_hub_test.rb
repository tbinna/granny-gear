require 'test_helper'

class InternalGearHubTest < ActiveSupport::TestCase
  setup do
    @rohloff_1x1 = internal_gear_hubs(:rohloff_1x1)
    @rohloff_too_big = internal_gear_hubs(:rohloff_too_big)
    @rohloff_too_small = internal_gear_hubs(:rohloff_too_small)
  end

  test "the gear ratio array should contain numeric values" do
    assert_not_nil @rohloff_1x1.gear_ratio, "Should not be nil"
    assert @rohloff_1x1.gear_ratio.count > 0, "Should have at least one element"
    assert_not @rohloff_1x1.gear_ratio.any? { |ratio| !ratio.is_a? Numeric }, "All elements should be Numeric"
  end

  test "calculate the gear ratios with 1 chainring and 1 sprocket should get the same gear ratio array" do
  	actual_ratios = @rohloff_1x1.gear_ratios.first[:data]
  	expected_ratios = @rohloff_1x1.gear_ratio
	
  	expected_ratios.zip(actual_ratios).each do |expected, actual|
    		assert_same(expected.to_f, actual.to_f)
    end
  end

  test "validate gear ratio should add an error if a ratio is smaller then the min allowed" do
    @rohloff_too_small.valid?
    assert_equal 1, @rohloff_too_small.errors[:gear_ratio].count
  end

  test "validate gear ratio should add an error if a ratio is bigger then the max allowed" do
    @rohloff_too_big.valid?
    assert_equal 1, @rohloff_too_big.errors[:gear_ratio].count
  end

  test "validation should add an error if a chainring is bigger then the max allowed" do
    @rohloff_too_big.valid?
    assert_equal 1, @rohloff_too_big.errors[:chainring].count
  end

  test "validation should add and error if chainring is smaller then the min allowed" do
    @rohloff_too_small.valid?
    assert_equal 1, @rohloff_too_small.errors[:chainring].count
  end

  test "validation should add an error if a sprocket is bigger then the max allowed" do
    @rohloff_too_big.valid?
    assert_equal 1, @rohloff_too_big.errors[:sprocket].count
  end

  test "validation should add and error if sprocket is smaller then the min allowed" do
    @rohloff_too_small.valid?
    assert_equal 1, @rohloff_too_small.errors[:sprocket].count
  end

  test "gear range for rohloff 14 speed hub is correct" do
    assert_in_delta 5.2581, @rohloff_1x1.gear_range, 0.001
  end
end
