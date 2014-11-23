class DerailleurGear < ActiveRecord::Base
	validates :name, :chainring, :cassette, presence: true

	def gear_ratio
		chainring_array = chainring.split(",").map{ |s| s.to_i }
		cassette_array = cassette.split(",").map{ |s| s.to_i }

		data = []

		cassette_array.sort.reverse.each { |sprocket|
			data_series = []
			chainring_array.each { |chainring|
				data_series << chainring.to_f / sprocket
			}
			data << {name: "#{sprocket}T", data: data_series}
		}
		data.to_json
	end
end
