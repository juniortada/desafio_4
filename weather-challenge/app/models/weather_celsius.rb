class WeatherCelsius
    def temperature(farenheit_temperature)
      temperature = ((farenheit_temperature -32) * 5/9).round(2)
    end
  end