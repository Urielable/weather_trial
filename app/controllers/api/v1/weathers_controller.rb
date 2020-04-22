class Api::V1::WeathersController < ApplicationController
  include OpenWeatherService

  def index
    @weather = LoadWeatherAction.execute(weather_params)
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

  def find
    @weather = FindWeatherAction.execute(weather_params)
    render :show
  end

  private
   # Never trust parameters from the scary internet, only allow the white list through.
    def weather_params
      params.permit(
        :attr,
        :order,
        :city_name
      )
    end
end
