json.array!(@derailleur_gears) do |derailleur_gear|
  json.extract! derailleur_gear, :id, :name, :chainring, :cassette
  json.url derailleur_gear_url(derailleur_gear, format: :json)
end
