require "test_helper"

class VideosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @video = videos(:one)
  end

  test "should get new" do
    sign_in users(:one)
    get new_video_url
    assert_response :success
  end

  test "should create video" do
    sign_in users(:one)
    assert_difference("Video.count") do
      file = fixture_file_upload("miles.mp4", "video/mp4")
      post videos_url, params: { video: { description: "Hello world", title: @video.title, user_id: @video.user_id, file: } }
    end

    assert_redirected_to video_url(Video.last)
  end

  test "should show video" do
    sign_in users(:one)
    get video_url(@video)
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:one)
    get edit_video_url(@video)
    assert_response :success
  end

  test "should update video" do
    sign_in users(:one)
    patch video_url(@video), params: { video: { description: "Hello world", title: @video.title } }
    assert_redirected_to video_url(@video)
  end

  test "should destroy video" do
    user = users(:one)
    sign_in user
    assert_difference("Video.count", -1) do
      delete video_url(@video)
    end

    assert_redirected_to user
  end
end
