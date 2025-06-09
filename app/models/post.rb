class Post < ApplicationRecord
  has_many :comments, dependent: :destroy

  belongs_to :user

  validates :title, :body, presence: true

  has_one_attached :image
end
