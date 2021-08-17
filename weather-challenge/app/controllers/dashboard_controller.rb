class DashboardController < ApplicationController
  include ApiHelper

  def index
    # temperature in celsius
    @weather_celsius = WeatherCelsius.new
    # favorite cities
    @cities = FavoriteCity.all
    if request.post?
      city = params[:city]
      begin 
        @weather = ApiHelper.get_weather(city)
        save_favorite_city(@weather.city)
      rescue
        # error, default city
        @weather = ApiHelper.get_weather('Sao Paulo')
      ensure
        render 'index'
      end
    else
      @weather = ApiHelper.get_weather('Sao Paulo')
    end
  end

  def save_favorite_city(city)
    if !FavoriteCity.exists?(name: city)
      FavoriteCity.create(name: city)
    end
  end
end