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
    # I swiped right
    Match.exists?(initiator: my_user, creator: self, status: 0) ||
      # I swiped left
      Match.exists?(initiator: my_user, creator: self, status: 1) ||
      # Someone swiped left on me
      Match.exists?(initiator: self, creator: my_user, status: 1) ||
      # Both swiped right
      Match.exists?(initiator: my_user, creator: self, status: 2) ||
      # Both swiped right but the other way
      Match.exists?(initiator: self, creator: my_user, status: 2)
  end

  # include PgSearch::Model

  # pg_search_scope :offers_search,
  #                 associated_against: {
  #                   offers: [:category]
  #                 },
  #                 using: {
  #                   tsearch: { prefix: true }
  #                 }
end
