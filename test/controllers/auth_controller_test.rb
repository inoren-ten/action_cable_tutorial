require "test_helper"

class AuthControllerTest < ActionDispatch::IntegrationTest
  test "should get check" do
    get auth_check_url
    assert_response :success
  end
end
