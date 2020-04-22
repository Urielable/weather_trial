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

  scope :custom_filter, ->(filter, order, item){
    if item == 'created_at'
      order(created_at: order)
    end
  }

  scope :_order, ->(item, order){
    order(item => order)
  }

  def self.all_weathers filter, order, item
    Weather.select
    .order(item => order)
  end

  def self.custom_order _attr, order
    Weather.current
    ._order(_attr, order)
  end
end
