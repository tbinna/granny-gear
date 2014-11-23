class AnalysisController < ApplicationController
	
	def setup
	end

	def result
		@drivetrain
		case params[:description]
		when 'DG'
			@drivetrain = DerailleurGear.new(derailleur_gear_params)
			@drivetrain.description = params[:description]
			@drivetrain.crankset = params[:crankset]
			@drivetrain.cassette = params[:cassette]
		when 'IGH'
			@drivetrain = InternalGearHub.new(internal_gear_hub_params)
			@drivetrain.description = params[:description]
			@drivetrain.gear_ratio = params[:gear_ratio]
			@drivetrain.chainring = params[:chainring]
			@drivetrain.sprocket = params[:sprocket]
		end
	end
end
