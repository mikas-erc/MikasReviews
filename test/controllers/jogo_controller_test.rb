require 'test_helper'

class JogoControllerTest < ActionDispatch::IntegrationTest
  test "should get view" do
    get jogo_view_url
    assert_response :success
  end

end
