require 'test_helper'

class DerailleurGearTest < ActiveSupport::TestCase

test "derailleur gears attributes must not be empty" do
    derailleur_gear = DerailleurGear.new
    assert derailleur_gear.invalid?
    assert derailleur_gear.errors[:description].any?
    assert derailleur_gear.errors[:crankset].any?
    assert derailleur_gear.errors[:cassette].any?
  end

test "gear ratio calculation results in the correct format and data" do
	derailleur_gear = DerailleurGear.new
end
end
