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


  #posts
  has_many :authored_posts, class_name: "Post"

  #comments
  has_many :authored_comments, class_name: "Comment"
  has_many :commented_posts, through: :comments, source: :post

  #likes
  has_many :likes
  has_many :liked_posts, through: :likes, source: :likeable, source_type: 'Post'
  has_many :liked_comments, through: :likes, source: :likeable, source_type: 'Comment'

end
