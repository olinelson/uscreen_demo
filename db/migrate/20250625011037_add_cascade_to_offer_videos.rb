class AddCascadeToOfferVideos < ActiveRecord::Migration[8.0]
  def change
    remove_foreign_key :offer_videos, :offers
    remove_foreign_key :offer_videos, :videos

    add_foreign_key :offer_videos, :offers, on_delete: :cascade
    add_foreign_key :offer_videos, :videos, on_delete: :cascade
  end
end
