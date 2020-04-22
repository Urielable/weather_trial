class Api::V1::WheatersController < ApplicationController
  include OpenWeatherService

  def index
    @wheater = LoadWheaterAction.execute
    render :index
  end

  def show
    openweather_services = OpenWeatherService::Request.new( )
    @response, code  = openweather_services.wheater_request
    if ("200".."299").include? code
      wheater = SaveWheaterAction.execute(@response)
      if wheater.valid?
        render :show, status: code
      else
        render :error, status: code
      end
    elsif ("400".."499").include? code
      render :error, status: code
    end
  end
end
