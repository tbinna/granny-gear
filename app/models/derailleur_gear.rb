class DerailleurGear < ActiveRecord::Base

	CRANKSET_MIN = 1
	CRANKSET_MAX = 70

	CASSETTE_MIN = 1
	CASSETTE_MAX = 50

	serialize :crankset, Array
	serialize :cassette, Array

	before_validation :convert_all_array_elements_to_i

	validates :description, :crankset, :cassette, presence: true
	validate :all_chainrings_in_range, :all_sprockets_in_range

	def gear_range
		(crankset.max.to_f / cassette.min) / (crankset.min.to_f / cassette.max)
	end

	def gear_spacing
		rcassette = cassette.sort.reverse
		rcassette.slice(1, rcassette.length).zip(rcassette).map { |i, j| (1.0/j - 1.0/i).abs * j }
	end

	def gear_spacing_categories
		(1..cassette.length-1).zip(2..cassette.length).map { |i,j| i.to_s << "/" << j.to_s }
	end

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

	private

	def values_in_range?(array, min, max)
		array.any? { |e| !e.between?(min, max) }
	end

	def all_chainrings_in_range
		if values_in_range?(crankset, CRANKSET_MIN, CRANKSET_MAX)
			errors.add(:crankset, "has to be between #{CRANKSET_MIN} and #{CRANKSET_MAX}")
		end
	end

	def all_sprockets_in_range
		if values_in_range?(cassette, CASSETTE_MIN, CASSETTE_MAX)
			errors.add(:cassette, "has to be between #{CASSETTE_MIN} and #{CASSETTE_MAX}")
		end
	end

	def convert_all_array_elements_to_i
		crankset.map! { |chainring| chainring.to_i }
		cassette.map! { |sprocket| sprocket.to_i }
	end
end
