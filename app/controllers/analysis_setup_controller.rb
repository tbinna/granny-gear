class AnalysisSetupController < ApplicationController
	def index
		@internal_gear_hub = InternalGearHub.new
		@derailleur_gear = DerailleurGear.new
	end
end
