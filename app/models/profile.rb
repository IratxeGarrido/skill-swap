class Profile < ApplicationRecord
  belongs_to :user
  has_many :matches_as_initiator, class_name: "Profile", foreign_key: :initiator_id
  has_many :matches_as_creator, class_name: "Profile", foreign_key: :creator_id
  has_many :messages_as_sender, class_name: "Profile", foreign_key: :sender_id
  has_many :messages_as_recipient, class_name: "Profile", foreign_key: :recipient_id
  has_many :reviews_as_reviewer, class_name: "Profile", foreign_key: :reviewer_id
  has_many :reviews_as_reviewee, class_name: "Profile", foreign_key: :reviewee_id
  has_many :offers
  has_one_attached :photo
  validates :photo, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  validates :age, numericality: { greater_than_or_equal_to: 18 } , presence: true
  validates :gender, presence: true, inclusion: { in: %w[Male Female Diverse PreferNotToSay] }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def is_match?(my_user)
    Match.where("initiator_id = ? AND creator_id = ? AND status = ?", my_user, self, 0).exists? || Match.where("initiator_id = ? AND status = ?", my_user, 1).exists? || Match.where("initiator_id = ? AND status = ?", self, 1).exists? || Match.where("initiator_id = ? AND creator_id = ? AND status = ?"  , my_user, self, 2).exists? || Match.where("initiator_id = ? AND creator_id = ? AND status = ?" , self, my_user, 2).exists?
  end

  include PgSearch::Model
  pg_search_scope :offers_search,
  associated_against: {
    offer: [:category]
  },
  using: {
    tsearch: { prefix: true }
  }
end
