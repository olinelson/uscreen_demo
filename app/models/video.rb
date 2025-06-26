class Video < ApplicationRecord
  belongs_to :user
  has_many :offer_videos
  has_many :offers, through: :offer_videos

  has_one_attached :file
  has_rich_text :description

  validates :title, presence: true
  validates :description, presence: true
  validates :file, presence: true
end
