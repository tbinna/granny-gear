class AnalysisController < ApplicationController
	
	def setup
		@derailleur_gear = DerailleurGear.new
		@internal_gear_hub = InternalGearHub.new
	end

	def result
		@drivetrain
		case params[:gear_type]
		when 'DG'
			@drivetrain = DerailleurGear.new
			@drivetrain.name = params[:gear_type]
			@drivetrain.crankset = params[:crankset]
			@drivetrain.cassette = params[:cassette]
		when 'IGH'
			@drivetrain = InternalGearHub.new
			@drivetrain.name = params[:gear_type]
			@drivetrain.gear_ratio = params[:gear_ratio]
			@drivetrain.chainring = params[:chainring]
			@drivetrain.sprocket = params[:sprocket]
		end
	end
end
