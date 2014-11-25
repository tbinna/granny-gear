class InternalGearHub < ActiveRecord::Base

	GEAR_RATIO_MIN = 0.0
	GEAR_RATIO_MAX = 10.0

	CHAINRING_MIN = 0
	CHAINRING_MAX = 70

	SPROCKET_MIN = 0
	SPROCKET_MAX = 40
	
	before_validation :convert_gear_ratio_elements_to_f

	serialize :gear_ratio, Array
	
	validates :description, :gear_ratio, :chainring, :sprocket, presence: true
	validates :chainring, numericality: { only_integer: true, greater_then: CHAINRING_MIN, less_than_or_equal_to: CHAINRING_MAX }
	validates :sprocket, numericality: { only_integer: true, greater_then: CHAINRING_MAX, less_than_or_equal_to: SPROCKET_MAX }
	validate :all_gear_ratios_in_range

	def gear_ratios
		ratios = []
		gear_ratio.sort.each { |ratio|
			ratios << ratio * (chainring.to_f / sprocket)
		}
		[{name: "Internal Gear Hub", data: ratios}]
	end

	def gear_ratio_categories
		(1..gear_ratio.count).to_a
	end

	private

	def all_gear_ratios_in_range
		if gear_ratio.any? { |ratio| !ratio.between?(GEAR_RATIO_MIN, GEAR_RATIO_MAX) }
			errors.add(:gear_ratio, "has to be between #{GEAR_RATIO_MIN} and #{GEAR_RATIO_MAX}")
		end
	end

	def convert_gear_ratio_elements_to_f
		gear_ratio.map! { |ratio| ratio.to_f }
	end
end
