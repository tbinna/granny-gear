class DerailleurGear < ActiveRecord::Base
	serialize :crankset, Array
	serialize :cassette, Array

	validates :description, :crankset, :cassette, presence: true

	CRANKSET_MIN = 0
	CRANKSET_MAX = 70

	CASSETTE_MIN = 0
	CASSETTE_MAX = 50


	def gear_ratios
		data = []

		cassette.sort.reverse.each { |sprocket|
			data_series = []
			crankset.sort.each { |chainring|
				data_series << chainring.to_f / sprocket
			}
			data << {name: "#{sprocket}T", data: data_series}
		}
		data
	end

	def gear_ratio_categories
		crankset.map { |i| i.to_s << 'T' }
	end
end
