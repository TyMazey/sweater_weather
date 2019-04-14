class HourlyForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :time, :temperature
end
