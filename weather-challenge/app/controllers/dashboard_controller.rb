class DashboardController < ApplicationController
  include ApiHelper

  def index
    @weather_celsius = WeatherCelsius.new
    if request.post?
      city = params[:city]
      begin 
        @weather = ApiHelper.get_weather(city)
      rescue
        # error, default city
        @weather = ApiHelper.get_weather("Sao Paulo")
      ensure
        render 'index'
      end
    else
      @weather = ApiHelper.get_weather("Sao Paulo")
    end
  end
end
