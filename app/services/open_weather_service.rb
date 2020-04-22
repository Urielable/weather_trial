# -*- encoding : utf-8 -*-
module OpenWeatherService
  class Request
    require 'uri'
    require 'net/http'

    # Request sample:
    # openweather_services = OpenWeatherService::Request.new(
    #     { 
    #       city_name: "Monterrey",
    #       api_key: "1234"
    #     }
    #   )
    # array, code  = openweather_services.weather_request

    def initialize options = {}
      @city_name = options.fetch(:city_name, "Monterrey")
      @api_key   = options.fetch(:api_key, Rails.application.secrets.open_weather_map_key)
    end

    def weather_request
      url = URI(ENV['OPEN_WEATHER_HOST']+"weather?q=#{@city_name}"+"&appid=#{@api_key}&units=metric")
      http = Net::HTTP.new(url.host)
      request = Net::HTTP::Get.new(url)
      response = http.request(request)
      if ("200".."299").include? response.code
        [format_response(response.read_body), response.code]
      elsif ("400".."499").include? response.code
        [format_response(response.read_body), response.code]
      end
    end

    def format_response response_format
      ActiveSupport::HashWithIndifferentAccess.new( JSON.parse(response_format) )
    end

  end
end