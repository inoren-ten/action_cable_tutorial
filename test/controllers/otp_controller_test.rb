require "test_helper"

class OtpControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get otp_show_url
    assert_response :success
  end
end
