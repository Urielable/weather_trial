require 'test_helper'

class Api::V1::WeathersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_weathers_index_url
    assert_response :success
  end

  test "should get get" do
    get api_v1_weathers_get_url
    assert_response :success
  end

end
