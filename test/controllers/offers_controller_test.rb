require "test_helper"

class OffersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @offer = offers(:one)
  end

  test "should get new" do
    sign_in users(:one)
    get new_offer_url
    assert_response :success
  end

  test "should create offer" do
    user = users(:one)
    sign_in user
    video = user.videos.first
    assert_difference("Offer.count") do
      post offers_url, params: { offer: { description: "hello world", subtitle: @offer.subtitle, title: @offer.title, user_id: @offer.user_id, video_ids: [ video.id ]  } }
    end

    assert_redirected_to offer_url(Offer.last)
  end

  test "should show offer" do
    sign_in users(:one)
    get offer_url(@offer)
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:one)
    get edit_offer_url(@offer)
    assert_response :success
  end

  test "should update offer" do
    user = users(:one)
    sign_in user
    video = user.videos.first
    patch offer_url(@offer), params: { offer: { description: "Hello world", subtitle: @offer.subtitle, title: @offer.title, video_ids: [ video.id ] } }
    assert_redirected_to offer_url(@offer)
  end

  test "should destroy offer" do
    user = users(:one)
    sign_in user
    assert_difference("Offer.count", -1) do
      delete offer_url(@offer)
    end

    assert_redirected_to user_url(user)
  end
end
