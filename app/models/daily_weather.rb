class DailyWeather
  attr_reader :id,
              :icon,
              :precip_probibility,
              :precip_type,
              :temp_high,
              :temp_low

  def initialize(id, info)
    @id = id
    @icon = info[:icon]
    @precip_probibility = percent(info[:precipProbability])
    @precip_type = info[:precipType]
    @temp_high = info[:temperatureHigh].to_i
    @temp_low = info[:temperatureLow].to_i
  end

  def percent(num)
    num * 100
  end
end
