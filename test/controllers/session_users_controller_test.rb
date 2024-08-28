require "test_helper"

class SessionUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get session_users_new_url
    assert_response :success
  end

  test "should get create" do
    get session_users_create_url
    assert_response :success
  end
end
