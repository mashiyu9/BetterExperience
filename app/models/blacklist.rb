class Blacklist < ApplicationRecord
  belongs_to :blocker_user, class_name: "User"
  belongs_to :blocking_user, class_name: "User"
end
