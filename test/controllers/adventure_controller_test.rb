require 'test_helper'

class AdventureControllerTest < ActionDispatch::IntegrationTest
  test "should get create_and_research" do
    get adventure_create_and_research_url
    assert_response :success
  end

end
