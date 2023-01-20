class CreateFriendships < ActiveRecord::Migration[7.0]
  def change
    create_table :friendships do |t|
      t.belongs_to :follower
      t.belongs_to :followee
      t.belongs_to :requestor
      t.belongs_to :requestee
      t.boolean :accepted

      t.timestamps
    end
  end
end
