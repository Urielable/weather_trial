class Weather < ApplicationRecord

   scope :current, ->(){
    select(:city_id, 
          :temp, 
          :temp_max, 
          :temp_min,
          :city_name,
          :metric,
          :created_at)
  }

  scope :custom_filter, ->(_attr, filter){
    if filter == 'max'
      maximum(_attr)
    elsif filter == 'min'
      minimum(_attr)
    end
  }

  scope :_order, ->(item, order){
    order(item => order)
  }

  def self.all_weathers _attr, filter
    Weather.select
    .custom_filter(_attr, filter)
  end

  def self.custom_order _attr, order
    Weather.current
    ._order(_attr, order)
  end
end
