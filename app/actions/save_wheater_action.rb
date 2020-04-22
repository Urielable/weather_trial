# -*- encoding : utf-8 -*-
class SaveWheaterAction

  def self.execute(wheater)
    wheater = Wheater.create(city_name: wheater.dig(:name), 
    temp:wheater.dig(:main, :temp), 
    temp_max:wheater.dig(:main, :temp_max), 
    temp_min:wheater.dig(:main, :temp_min), 
    metric:'metric', 
    city_id:wheater.dig(:sys, :id))
  end
  
end