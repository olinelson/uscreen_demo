class Video < ApplicationRecord
  belongs_to :user
  has_one_attached :file
  has_rich_text :description

  validates :title, presence: true
  validates :description, presence: true
  validates :file, presence: true
end
