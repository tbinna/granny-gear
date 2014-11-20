require 'test_helper'

class DerailleurGearTest < ActiveSupport::TestCase

test "derailleur gears attributes must not be empty" do
    derailleur_gear = DerailleurGear.new
    assert derailleur_gear.invalid?
    assert derailleur_gear.errors[:name].any?
    assert derailleur_gear.errors[:chainring].any?
    assert derailleur_gear.errors[:cassette].any?
  end
end
