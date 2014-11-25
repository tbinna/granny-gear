module AnalysisHelper
	def mean(array)
		array.inject(0) { |sum, x| sum += x } / array.size.to_f
	end

	def variance(array)
		array.inject(0) { |variance, x| variance += (x - mean(array)) ** 2 }
	end

	def standard_deviation(array)
		Math.sqrt(variance(array)/(array.size-1))
	end
end
