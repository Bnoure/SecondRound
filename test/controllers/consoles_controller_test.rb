require "test_helper"

class ConsolesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get consoles_index_url
    assert_response :success
  end
end
