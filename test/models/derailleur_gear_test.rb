require 'test_helper'

class DerailleurGearTest < ActiveSupport::TestCase

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
end
