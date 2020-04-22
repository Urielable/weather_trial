# -*- encoding : utf-8 -*-
class LoadWeatherAction

  def self.execute(params)
    # TODO: adds attributes for query
    _attr = params.fetch(:attr, 'created_at');
    order = params.fetch(:order, 'ASC');
    Weather.custom_order(_attr, order)
  end
  
end