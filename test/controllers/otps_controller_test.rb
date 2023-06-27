require "test_helper"

class OtpsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get otps_show_url
    assert_response :success
  end
end
