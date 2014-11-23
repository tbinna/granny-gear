json.array!(@internal_gear_hubs) do |internal_gear_hub|
  json.extract! internal_gear_hub, :id, :description, :gear_ratio, :chainring, :sprocket
  json.url internal_gear_hub_url(internal_gear_hub, format: :json)
end
