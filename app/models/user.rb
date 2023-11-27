class User < ApplicationRecord
  has_one :profile, dependent: :destroy
  #used has one because each user can have a single profile
  validates :email, presence: true, uniqueness: true, format: validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  #should I use the on create here?
  PASSWORD_REQUIREMENT = /\A
    (?=.{8,})
    (?=.*\d)
    (?=.*[a-z])
    (?=.*[A-Z])
    (?=.*[[:^alnum:]])
  /x
  validates :password, presence: true, format: PASSWORD_REQUIREMENT
end
