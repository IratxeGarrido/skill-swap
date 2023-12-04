class Message < ApplicationRecord
  belongs_to :match
  belongs_to :sender, class_name: "Profile"
  validates :content, presence: true
  #should I validatethe content be true?
  #should I validate the read status?
  def sender?(a_user)
    sender_id == a_user.id
  end
end
