# -*- encoding : utf-8 -*-
class SaveWeatherAction

  def self.execute(weather)
    weather = Weather.create(city_name: weather.dig(:name), 
    temp:weather.dig(:main, :temp), 
    temp_max:weather.dig(:main, :temp_max), 
    temp_min:weather.dig(:main, :temp_min), 
    metric:'metric', 
    city_id:weather.dig(:sys, :id))
  end
  
end