class WeathersController < ApplicationController
  def index

  end

  def get
  end

 # Only allow a trusted parameters
  def weathers_get_params
    params.permit(
      :city_name,
      :apikey
    )
  end
end
