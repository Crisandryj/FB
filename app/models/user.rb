class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 has_many :followed_friends, class_name: "Friendship", foreign_key: :follower
 has_many :followees, through: :friendships

 has_many :friend_follows, class_name: "Friendship", foreign_key: :followee
 has_many :followers, through: :friendships



end
