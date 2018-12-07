require 'test_helper'

class RoleplayControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get roleplay_index_url
    assert_response :success
  end

end
