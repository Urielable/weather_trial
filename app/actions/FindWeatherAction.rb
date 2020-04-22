# -*- encoding : utf-8 -*-
class FindWeatherAction

  def self.execute(params)
    # TODO: adds attributes for query
    _attr = params.fetch(:attr, 'temp')
    filter =params.fetch(:filter, 'min')
    Weather.custom_filter(_attr, filter)
  end
  
end