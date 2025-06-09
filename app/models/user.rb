class User < ApplicationRecord
  has_secure_password

  has_many :posts, dependent: :destroy

  validates :email, presence: true, uniqueness: true

  normalizes :email, with: -> { _1.strip.downcase }
end
