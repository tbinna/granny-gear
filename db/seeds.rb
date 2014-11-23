# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
derailleur_gears = DerailleurGear.create([{name: "Standard 3x9", crankset: "19,25,43", cassette: "12,14,16,18,20,22,25,28,32"}])