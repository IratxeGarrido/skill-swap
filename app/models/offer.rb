class Offer < ApplicationRecord
  belongs_to :profile
  validates :description, presence: true
  validates :category, presence: true, inclusion: { in: ["Painting", "Drawing", "Calligraphy", "Candle Making", "Carpentry", "Ceramics", "Coding", "Embroidery", "Fishing", "Knitting/Crocheting", "Macramé", "Music", "Origami", "3D Printing", "Photography", "Sewing", "Skateboarding", "Soap Making", "Tattooing"] }
  has_one_attached :photo
  validates :photo, presence: true
end
