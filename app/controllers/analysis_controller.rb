class AnalysisController < ApplicationController
	
	def setup
		@crankset_placeholder = [24, 32, 44]
		@cassette_placeholder = [11, 13, 15, 17, 19, 21, 24, 27, 31, 35, 40]

		@gear_ratio_placeholder = [0.279,0.316,0.36,0.409,0.464,0.528,0.6,0.682,0.774,0.881,1,1.135,1.292,1.467]
	end

	def result
		@drivetrain = DerailleurGear.new

		case params[:description]
		when 'DG'
			@drivetrain = DerailleurGear.new
			@drivetrain.description = params[:description]
			@drivetrain.crankset = params[:crankset].map { |s| s.to_i }
			@drivetrain.cassette = params[:cassette].map { |s| s.to_i }
		when 'IGH'
			@drivetrain = InternalGearHub.new
			@drivetrain.description = params[:description]
			@drivetrain.gear_ratio = params[:gear_ratio].map { |s| s.to_f }
			@drivetrain.chainring = params[:chainring]
			@drivetrain.sprocket = params[:sprocket]
		else
			not_found
		end
	end
end
