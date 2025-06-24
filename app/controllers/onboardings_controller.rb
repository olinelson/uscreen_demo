class OnboardingsController < ApplicationController
  before_action :set_steps

  # GET /onboarding
  def show
    @user = Current.user
    if @user.videos.none?
      redirect_to first_video_onboarding_path
    elsif @user.videos.none?
      redirect_to first_offer_onboarding_path
    else
      redirect_to @user.offers.first
    end
  end

  def first_video
  end

  def first_offer
  end

  private

  def set_steps
    @steps = [ "first_video", "first_offer", "launch" ]
  end
end
