module ApiHelper
  # validate city empty and query openweatherapi
  def self.get_weather(city)
    unless city.to_s.strip.empty?
      city = I18n.transliterate(city)
      Openweather2.get_weather(city: "#{city},BR", units: 'imperial')
    end
  end

  def get_weather(city)
    ApiHelper.get_weather(city)
  end
end
