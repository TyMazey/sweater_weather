class CurrentWeather
  attr_reader :id,
              :address,
              :country,
              :time,
              :summary,
              :icon,
              :temperature,
              :apparent_temperature,
              :humidity,
              :uv_index,
              :visibility,
              :today,
              :temp_high,
              :temp_low,
              :tonight

  def initialize(address, info)
    @id = 1
    @address = address
    @country = onlycountry(info[:timezone])
    @time = Time.at(info[:currently][:time]).strftime("%I:%M %p, %d/%m")
    @summary = info[:currently][:summary]
    @icon = info[:currently][:icon]
    @temperature = info[:currently][:temperature].to_i
    @apparent_temperature = info[:currently][:apparentTemperature].to_i
    @humidity = percent(info[:currently][:humidity])
    @uv_index = info[:currently][:uvIndex]
    @visibility = info[:currently][:visibility]
    @today = info[:daily][:data][0][:summary]
    @temp_high = info[:daily][:data][0][:temperatureHigh].to_i
    @temp_low = info[:daily][:data][0][:temperatureLow].to_i
    @tonight = info[:daily][:summary]
  end

  def onlycountry(string)
    country = string.split("/")
    country[0]
  end

  def percent(num)
    num * 100
  end
end
