module ApplicationHelper

  def weather_stub
    {
    timezone: "America/Los_Angeles",
    currently: {
        time: 1555189004,
        summary: "Partly Cloudy",
        icon: "partly-cloudy-day",
        temperature: 63.62,
        apparentTemperature: 63.62,
        humidity: 0.63,
        uvIndex: 6,
        visibility: 7.46,
    },
    hourly: {
       data: [
           {
               time: 1555185600,
               icon: "partly-cloudy-day",
               temperature: 62.47,
           }
         ]
       },
       daily: {
        summary: "Light rain on Monday, with high temperatures bottoming out at 55°F on Monday.",
        icon: "rain",
        data: [
            {
                time: 1555138800,
                summary: "Partly cloudy starting in the afternoon.",
                icon: "partly-cloudy-day",
                precipProbability: 0.08,
                precipType: "rain",
                temperature: 62.47,
                temperatureHigh: 63.69,
                temperatureLow: 50.9,
            },
            {
                time: 1555225200,
                summary: "Mostly cloudy throughout the day.",
                icon: "partly-cloudy-day",
                precipProbability: 0.07,
                precipType: "rain",
                temperatureHigh: 59.37,
                temperatureLow: 50.92,
            }
          ]
        }
      }
  end
end
