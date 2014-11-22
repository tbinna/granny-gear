class AnalysisController < ApplicationController
	
	def setup
		@derailleur_gear = DerailleurGear.new
		@internal_gear_hub = InternalGearHub.new
	end

	def result
		@cr = params[:chainring]
		@cs = params[:cassette]

		@derailleur_gear = DerailleurGear.new
		@derailleur_gear.name = "DG"
		@derailleur_gear.chainring = params[:chainring]
		@derailleur_gear.cassette = params[:cassette]
	end
end
