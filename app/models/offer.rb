class Offer < ApplicationRecord
  enum :status, [ :draft, :published ], default: :draft
  belongs_to :user
  has_many :offer_videos
  has_many :videos, through: :offer_videos
  has_rich_text :description

  validates :title, presence: true
  validates :subtitle, presence: true
  validates :description, presence: true
end
