require 'test_helper'

class Public::NewssControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_newss_index_url
    assert_response :success
  end

  test "should get show" do
    get public_newss_show_url
    assert_response :success
  end

end
