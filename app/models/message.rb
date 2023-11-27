class Message < ApplicationRecord
  belongs_to :matches
  belongs_to :sender, class_name: "Profile"
  belongs_to :recipient, class_name: "Profile"
  validates :content, presence: true
  #should I validatethe content be true?
  #should I validate the read status?
end
