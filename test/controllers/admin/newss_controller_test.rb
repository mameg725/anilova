require 'test_helper'

class Admin::NewssControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_newss_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_newss_show_url
    assert_response :success
  end

end
