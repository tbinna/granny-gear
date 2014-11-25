require 'test_helper'

class DerailleurGearTest < ActiveSupport::TestCase

	setup do
		@mountain_bike_3x9 = derailleur_gears(:mountain_bike_3x9)
	end

	test "derailleur gears attributes must not be empty" do
		derailleur_gear = DerailleurGear.new
		assert derailleur_gear.invalid?
		assert derailleur_gear.errors[:description].any?
		assert derailleur_gear.errors[:crankset].any?
		assert derailleur_gear.errors[:cassette].any?
	end

	test "validate should add an error if crankset conatains value that is smaller then the min allowed" do
		derailleur_gear = derailleur_gears(:singlespeed_too_big)
		derailleur_gear.valid?
		assert_equal 1, derailleur_gear.errors[:crankset].count
	end

	test "validate should add an error if crankset contains value that is bigger then the min allowed" do
		derailleur_gear = derailleur_gears(:singlespeed_too_small)
		derailleur_gear.valid?
		assert_equal 1, derailleur_gear.errors[:crankset].count
	end

	test "validate should add an error if cassette conatains value that is smaller then the min allowed" do
		derailleur_gear = derailleur_gears(:singlespeed_too_big)
		derailleur_gear.valid?
		assert_equal 1, derailleur_gear.errors[:cassette].count
	end

	test "validate should add an error if cassette contains value that is bigger then the min allowed" do
		derailleur_gear = derailleur_gears(:singlespeed_too_small)
		derailleur_gear.valid?
		assert_equal 1, derailleur_gear.errors[:cassette].count
	end

	test "gear range for moutain bike 3x9 speed is correct" do
		assert_in_delta 5.1944, @mountain_bike_3x9.gear_range, 0.001
	end

	test "gear spacing for mountain bike 3x9 speed is correct" do
		expected_gear_spacing = [0.133, 0.153, 0.130, 0.150, 0.111, 0.125, 0.142, 0.166]
		actual_gear_spacing = @mountain_bike_3x9.gear_spacing
		assert_equal expected_gear_spacing.size, actual_gear_spacing.size
		expected_gear_spacing.zip(actual_gear_spacing).each do |expected, actual|
			assert_in_delta expected, actual, 0.001
		end
	end
end
