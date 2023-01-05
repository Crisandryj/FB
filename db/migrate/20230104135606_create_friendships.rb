class CreateFriendships < ActiveRecord::Migration[7.0]
  def change
    create_table :friendships do |t|
      t.belongs_to :user
      t.belongs_to :friend_follow
      t.belongs_to :followed_friend

      t.timestamps
    end
  end
end
