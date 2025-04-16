class Post < ApplicationRecord
  validates :title, :body, presence: true

  has_one_attached :image
end
