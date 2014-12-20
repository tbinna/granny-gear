class InternalGearHubAnalysisController < ApplicationController
	before_action :set_internal_gear_hub, only: [:result]

	def result
		render 'shared/result', locals: { drivetrain: @internal_gear_hub }
	end

	private

	def pre_process_params
		params[:internal_gear_hub][:gear_ratio].map! { |s| s.to_f }
	end

	def set_internal_gear_hub
		if params[:custom]
			pre_process_params
			@internal_gear_hub = InternalGearHub.new(internal_gear_hub_params)
		else
			@internal_gear_hub = InternalGearHub.find(params[:id])
		end
	end

	def internal_gear_hub_params
		params.require(:internal_gear_hub).permit(:description, :chainring, :sprocket, :gear_ratio => [])
	end
end
