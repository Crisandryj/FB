class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 #has_many :name
 #class_name: "Name"
 #foreign_key: :name
 #has_many :name, through: :name

  #user has many friendships as a follower
  #user has man friendships as a followee

  has_many :follower_friends, class_name: "Friendship", foreign_key: :followee_id
  has_many :followers, through: :follower_friends

  has_many :followee_friends, class_name: "Friendship", foreign_key: :follower_id
  has_many :followees, through: :followee_friends

  #requests
  has_many :friendship_requests, class_name: "Friendship", foreign_key: :requestee_id
  has_many :requestors, through: :friendship_requests

  has_many :freindship_requested, class_name: "Friendship", foreign_key: :requestor_id
  has_many :requestees, through: :freindship_requested

  #posts
  has_many :authored_posts, class_name: "Post"

  #comments
  has_many :comments
  has_many :commented_posts, through: :comments, source: :post

  #likes
  has_many :likes, as: :likeable

end
