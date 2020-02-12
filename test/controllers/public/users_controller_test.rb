require 'test_helper'

class Public::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_users_show_url
    assert_response :success
  end

  test "should get mypage" do
    get public_users_mypage_url
    assert_response :success
  end

  test "should get edit" do
    get public_users_edit_url
    assert_response :success
  end

  test "should get follower" do
    get public_users_follower_url
    assert_response :success
  end

  test "should get followed" do
    get public_users_followed_url
    assert_response :success
  end

  test "should get favoindex" do
    get public_users_favoindex_url
    assert_response :success
  end

end
