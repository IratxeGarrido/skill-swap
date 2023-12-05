class Match < ApplicationRecord
  belongs_to :initiator, class_name: "Profile"
  belongs_to :creator, class_name: "Profile", optional: true
  has_many :messages
  enum status: [ :pending, :rejected, :accepted ]
  validates :initiator_id, uniqueness: {scope: :creator_id }
end
