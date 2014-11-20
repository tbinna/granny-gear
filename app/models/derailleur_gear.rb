class DerailleurGear < ActiveRecord::Base
	validates :name, :chainring, :cassette, presence: true
end
