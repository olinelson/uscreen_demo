class PagesController < ApplicationController
  allow_unauthenticated_access

  def index
    @offers = Offer.where(status: :published).order(created_at: :desc)
  end
end
