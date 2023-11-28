class Profile < ApplicationRecord
  belongs_to :user
  has_many :matches_as_initiator, class_name: "Profile", foreign_key: :initiator_id
  has_many :matches_as_creator, class_name: "Profile", foreign_key: :creator_id
  has_many :messages_as_sender, class_name: "Profile", foreign_key: :sender_id
  has_many :messages_as_recipient, class_name: "Profile", foreign_key: :recipient_id
  has_many :reviews_as_reviewer, class_name: "Profile", foreign_key: :reviewer_id
  has_many :reviews_as_reviewee, class_name: "Profile", foreign_key: :reviewee_id
  has_one_attached :photo

  validates :word_count_validation
  validates :age, numericality: { greater_than_or_equal_to: 18 }
  enum gender: [ :male, :female, :diverse, :na]
  validates :gender, presence: true, inclusion: { in: %w[Male Female Diverse PreferNotToSay]}

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  private

  def word_count_validation
    if bio.present? && bio.split.size > 500
      errors.add(:bio, "can't have more than 500 words")
    end
  end

end
