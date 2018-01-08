require 'test_helper'

class ContaControllerTest < ActionDispatch::IntegrationTest
  test "should get view" do
    get conta_view_url
    assert_response :success
  end

end
