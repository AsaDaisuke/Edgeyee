require 'test_helper'

class ConsoleControllerTest < ActionDispatch::IntegrationTest
  test "should get view" do
    get console_view_url
    assert_response :success
  end

end
