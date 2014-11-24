class InternalGearHub < ActiveRecord::Base
	serialize :gear_ratio, Array
	
	validates :description, :gear_ratio, :chainring, :sprocket, presence: true

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
end
