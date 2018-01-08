require 'test_helper'

class FrontofficeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get frontoffice_index_url
    assert_response :success
  end

end
