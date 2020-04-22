require 'test_helper'

class Api::V1::WeathersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get '/api/v1/weathers'
    assert_response :success
  end

end
