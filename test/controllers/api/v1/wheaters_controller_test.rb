require 'test_helper'

class Api::V1::WheatersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_wheaters_index_url
    assert_response :success
  end

  test "should get get" do
    get api_v1_wheaters_get_url
    assert_response :success
  end

end
