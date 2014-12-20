class DerailleurGearAnalysisController < ApplicationController
	before_action :set_derailleur_gear, only: [:result]

	def result
		render 'shared/result', locals: { drivetrain: @derailleur_gear }
	end

	private

	def pre_process_params
		params[:derailleur_gear][:crankset].map! { |s| s.to_i }
		params[:derailleur_gear][:cassette].map! { |s| s.to_i }
	end
	
	def set_derailleur_gear
		if params[:custom]
			pre_process_params
			@derailleur_gear = DerailleurGear.new(derailleur_gear_params)
		else
			@derailleur_gear = DerailleurGear.find(params[:id])
		end
	end

	def derailleur_gear_params
		params.require(:derailleur_gear).permit(:description, :crankset => [], :cassette => [])
	end
end
