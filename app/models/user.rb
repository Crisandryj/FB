class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable,
         omniauth_providers: %i[facebook]
  # has_many :name
  # class_name: "Name"
  # foreign_key: :name
  # has_many :name, through: :name

  # user has many friendships as a follower
  # user has man friendships as a followee

  has_many :follower_friends, class_name: 'Friendship', foreign_key: :followee_id
  has_many :followers, through: :follower_friends

  has_many :followee_friends, class_name: 'Friendship', foreign_key: :follower_id
  has_many :followees, through: :followee_friends

  # requests
  has_many :friendship_requests, class_name: 'Friendship', foreign_key: :requestee_id
  has_many :requestors, through: :friendship_requests

  has_many :freindship_requested, class_name: 'Friendship', foreign_key: :requestor_id
  has_many :requestees, through: :freindship_requested

  # posts
  has_many :authored_posts, class_name: 'Post'

  # comments
  has_many :authored_comments, class_name: 'Comment'
  has_many :commented_posts, through: :comments, source: :post

  # likes
  has_many :likes
  has_many :liked_posts, through: :likes, source: :likeable, source_type: 'Post'
  has_many :liked_comments, through: :likes, source: :likeable, source_type: 'Comment'

  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver
  end

  def self.from_omniauth(auth)
    find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      # user.name = auth.info.name   # assuming the user model has a name
      # user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if (data = session['devise.facebook_data'] && session['devise.facebook_data']['extra']['raw_info']) && user.email.blank?
        user.email = data['email']
      end
    end
  end
end
