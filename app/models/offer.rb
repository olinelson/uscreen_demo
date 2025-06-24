class Offer < ApplicationRecord
  enum :status, [ :draft, :published ], default: :draft
  belongs_to :user
  has_rich_text :description

  validates :title, presence: true
  validates :subtitle, presence: true
  validates :description, presence: true
end
