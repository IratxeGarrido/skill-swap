class Profile < ApplicationRecord
  belongs_to :user
  has_many :matches_as_initiator, class_name: "Profile", foreign_key: :initiator_id
  has_many :matches_as_creator, class_name: "Profile", foreign_key: :creator_id
  has_many :messages_as_sender, class_name: "Profile", foreign_key: :sender_id
  has_many :messages_as_recipient, class_name: "Profile", foreign_key: :recipient_id
  has_many :reviews_as_reviewer, class_name: "Profile", foreign_key: :reviewer_id
  has_many :reviews_as_reviewee, class_name: "Profile", foreign_key: :reviewee_id

  validates :word_count_validation
  validates :age, numericality: { greater_than_or_equal_to: 18 }
  validates :gender, presence: true, inclusion: { in: [0, 1, 2], message: "%{value} is not a valid value for gender" }
  validates :address, presence: true

  private

  def word_count_validation
    if bio.present? && bio.split.size > 500
      errors.add(:bio, "has more than 500 words")
    end
  end

end
