class Match < ApplicationRecord
  belongs_to :initiator , class_name: "Profile"
  belongs_to :creator, class_name: "Profile"
  has_many :messages
  validates :status
  #how should I validate the status here
  #
end
