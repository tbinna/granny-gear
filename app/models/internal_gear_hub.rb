class InternalGearHub < ActiveRecord::Base
	validates :name, :gear_ratio, :chainring, :sprocket, presence: true
end
