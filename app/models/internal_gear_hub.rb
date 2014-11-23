class InternalGearHub < ActiveRecord::Base
	validates :description, :gear_ratio, :chainring, :sprocket, presence: true

	def gear_ratios_calculation
		gear_ratio_array = gear_ratio.split(",").map{ |s| s.to_f }

		ratios = []
		gear_ratio_array.sort.each { |ratio|
			ratios << ratio * (chainring.to_f / sprocket)
		}
		ratios
	end

	def gear_ratios
		[{name: "Internal Gear Hub", data: gear_ratios_calculation}].to_json
	end

	def gear_ratio_categories
		(1..gear_ratio.split(",").count).to_a.to_json
	end
end
