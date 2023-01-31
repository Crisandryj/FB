class AddIndexToLike < ActiveRecord::Migration[7.0]
  def change
    add_index :likes, [:user_id, :likeable_type, :likeable_id], unique: true
  end
end
 
