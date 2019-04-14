class CurrentForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :address, :country, :time, :summary, :icon, :temperature, :apparent_temperature, :humidity, :uv_index, :visibility, :today, :temp_high, :temp_low, :tonight
end
