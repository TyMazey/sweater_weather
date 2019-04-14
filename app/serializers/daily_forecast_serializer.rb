class DailyForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :icon, :precip_probibility, :precip_type, :temp_high, :temp_low
end
