class DashboardController < ApplicationController
  def index
    # temperature in celsius
    @weather_celsius = WeatherCelsius.new
    # favorite cities
    @cities = FavoriteCity.all
    begin
      # inline if city search or gem geocoder
      city = request.post? ? params[:city] : request.location.city
      raise StandardError if city.empty?

      @weather = ApiHelper.get_weather(city)
      save_favorite_city(@weather.city)
    rescue StandardError
      # error, default city
      @weather = ApiHelper.get_weather('Sao Paulo')
    ensure
      render 'index'
    end
  end

  def save_favorite_city(city)
    FavoriteCity.create(name: city) unless FavoriteCity.exists?(name: city)
  end
end
