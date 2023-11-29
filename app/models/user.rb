class User < ApplicationRecord
  has_one :profile, dependent: :destroy
  #used has one because each user can have a single profile
#   validates :email, presence: true, uniqueness: true, format: validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
#   #should I use the on create here?
#   PASSWORD_REQUIREMENT = /\A
#   (?=.{8,})          # Must contain 8 or more characters
#   (?=.*\d)           # Must contain a digit
#   (?=.*[a-z])        # Must contain a lower case character
#   (?=.*[A-Z])        # Must contain an upper case character
#   (?=.*[[:^alnum:]]) # Must contain a symbol
# /x
#   validates :password, presence: true, format: PASSWORD_REQUIREMENT


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # after_create :create_profile

  # def create_profile
  #   Profile.create(user: self)
  # end
end
