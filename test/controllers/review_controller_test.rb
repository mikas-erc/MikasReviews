require 'test_helper'

class ReviewControllerTest < ActionDispatch::IntegrationTest
  test "should get view" do
    get review_view_url
    assert_response :success
  end

end
