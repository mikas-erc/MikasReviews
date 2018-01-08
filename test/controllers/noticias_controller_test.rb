require 'test_helper'

class NoticiasControllerTest < ActionDispatch::IntegrationTest
  test "should get view" do
    get noticias_view_url
    assert_response :success
  end

end
