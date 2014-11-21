class AnalysisController < ApplicationController
	
	def setup
		@derailleur_gear = DerailleurGear.new
		@internal_gear_hub = InternalGearHub.new
	end

	def result
		@params = []
		params.each do |key,value|
			@params << "Param #{key}: #{value}"
		end
	end
end
