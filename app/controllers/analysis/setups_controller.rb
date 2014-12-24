class Analysis::SetupsController < ApplicationController
	def show
		@internal_gear_hub = InternalGearHub.new
		@derailleur_gear = DerailleurGear.new
	end
end
