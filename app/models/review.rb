class Review < ApplicationRecord
  belongs_to :reviewer, class_name: "Profile"
  belongs_to :reviewee, class_name: "Profile"
end
