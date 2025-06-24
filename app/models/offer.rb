class Offer < ApplicationRecord
  enum :status, [ :draft, :published ], default: :draft
  belongs_to :user
end
