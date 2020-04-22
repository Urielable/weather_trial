class Api::V1::WeathersController < ApplicationController
  include OpenWeatherService

  def index
    @weather = LoadWeatherAction.execute
    render :index
  end

  def show
    openweather_services = OpenWeatherService::Request.new( )
    @response, code  = openweather_services.weather_request
    if ("200".."299").include? code
      @weather = SaveWeatherAction.execute(@response)
      if @weather.valid?
        render :show, status: code
      else
        render :error, status: code
      end
    elsif ("400".."499").include? code
      render :error, status: code
    end
  end
end
