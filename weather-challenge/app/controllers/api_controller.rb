class ApiController < ActionController::API
  include ApiHelper
  # return json with weather data
  def show
    begin
      @weather = ApiHelper.get_weather(params[:city])
    rescue Exception => e
      @weather = { error: e }
    end
    render json: @weather
  end
end
