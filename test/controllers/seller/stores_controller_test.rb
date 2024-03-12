require "test_helper"

class Seller::StoresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get seller_stores_index_url
    assert_response :success
  end

  test "should get show" do
    get seller_stores_show_url
    assert_response :success
  end
end
