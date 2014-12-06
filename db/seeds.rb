# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


derailleur_gears = DerailleurGear.create([{description: "Standard 3x9", crankset: [19,25,43], cassette: [12,14,16,18,20,22,25,28,32]}])

internal_gear_hubs = InternalGearHub.create([
	{description: "Rohloff SPEEDHUB 500/14", gear_ratio: [0.279,0.316,0.36,0.409,0.464,0.528,0.6,0.682,0.774,0.881,1,1.135,1.292,1.467], chainring: 40, sprocket: 16},
	{description: "Shimano Alfine 700/11", gear_ratio: [0.527, 0.681, 0.770, 0.878, 0.995, 1.134, 1.292, 1.462, 1.667, 1.888, 2.153], chainring: 40, sprocket: 16}])