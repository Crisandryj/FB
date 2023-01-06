class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many: :friend_follows, class_name: "Friendship", foreign_key: :follower_id
  has_many: :followees, through: :friend_follows

  has_many: :friend_followers, class_name: "Friendship", foreign_key: :followee_id
  has_many: :followers, through: :friend_followers




end
