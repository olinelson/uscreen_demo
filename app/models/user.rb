class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :videos
  has_many :offers

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  alias_attribute :email, :email_address
end
