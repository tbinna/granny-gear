class DerailleurGear < ActiveRecord::Base
	validates :name, :chainring, :cassette, presence: true

	def gear_ratio
		chainring_array = chainring.split(",").map{ |s| s.to_i }
		cassette_array = cassette.split(",").map{ |s| s.to_i }

		data = []

		chainring_array.each { |chainring|
			data_series = {}
			cassette_array.sort.reverse.each { |sprocket|
				data_series["#{chainring}/#{sprocket}"] = chainring.to_f / sprocket
			}
			data << {name: "#{chainring}", data: data_series}
		}
		data
	end
end
