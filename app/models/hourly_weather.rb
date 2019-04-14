class HourlyWeather
  attr_reader :id,
              :time,
              :temperature

  def initialize(id, info)
    @id = id
    @time = Time.at(info[:time]).strftime("%I %p")
    @temperature = info[:temperature].to_i
  end
end
