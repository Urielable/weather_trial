require 'test_helper'

class Api::V1::WeathersControllerTest < ActionDispatch::IntegrationTest
  test "should get all wheaters" do
    get api_v1_weathers_url
    assert_response :success
  end

  test "should get all wheaters ordering" do
    get '/api/v1/weathers?attr=temp&order=asc'
    assert_response :success
  end

  test "should get real value" do
    get '/api/v1/weathers/show'
    assert_response :success
  end

end
