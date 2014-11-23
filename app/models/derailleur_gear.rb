class DerailleurGear < ActiveRecord::Base
	validates :description, :crankset, :cassette, presence: true

	def gear_ratios
		crankset_array = crankset.split(",").map{ |s| s.to_i }
		cassette_array = cassette.split(",").map{ |s| s.to_i }

		data = []

		cassette_array.sort.reverse.each { |sprocket|
			data_series = []
			crankset_array.each { |chainring|
				data_series << chainring.to_f / sprocket
			}
			data << {name: "#{sprocket}T", data: data_series}
		}
		data.to_json
	end

	def gear_ratio_categories
		crankset.split(",").map { |s| s << 'T' }.to_json
	end
end
