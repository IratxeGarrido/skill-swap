class Offer < ApplicationRecord
  belongs_to :profile
  validates :description, presence: true
  validates :category, presence: true
  has_one_attached :photo
  validates :photo, presence: true
end
