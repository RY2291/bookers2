class Relationship < ApplicationRecord
  #:followerは:follower_id
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
end
