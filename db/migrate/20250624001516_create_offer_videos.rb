class CreateOfferVideos < ActiveRecord::Migration[8.0]
  def change
    create_table :offer_videos do |t|
      t.references :offer, null: false, foreign_key: true
      t.references :video, null: false, foreign_key: true

      t.timestamps
    end
  end
end
