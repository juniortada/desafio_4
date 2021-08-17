class DashboardController < ApplicationController

  def index
    # temperature in celsius
    @weather_celsius = WeatherCelsius.new
    # favorite cities
    @cities = FavoriteCity.all
    begin
      # inline if city search or gem geocoder
      request.post? ? city = params[:city] : city = request.location.city
      raise StandardError if city.empty?
      @weather = ApiHelper.get_weather(city)
      save_favorite_city(@weather.city)
    rescue
      # error, default city
      @weather = ApiHelper.get_weather('Sao Paulo')
    ensure
      render 'index'
    end
  end

  def save_favorite_city(city)
    if !FavoriteCity.exists?(name: city)
      FavoriteCity.create(name: city)
    end
  end
end