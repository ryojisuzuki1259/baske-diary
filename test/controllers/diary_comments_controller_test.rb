require 'test_helper'

class DiaryCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get diary_comments_create_url
    assert_response :success
  end

  test "should get destroy" do
    get diary_comments_destroy_url
    assert_response :success
  end
end
