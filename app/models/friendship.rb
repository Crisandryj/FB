class Friendship < ApplicationRecord
belongs_to :follower, class_name: "User"
belongs_to :followee, class_name: "User"
#freindship_requests
belongs_to :requestor, class_name: "User"
belongs_to :requestee, class_name: "User"
end
