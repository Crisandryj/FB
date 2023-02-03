class ChangeColumnNull < ActiveRecord::Migration[7.0]
  def change
    remove_column :friendships, :requestee_id
    remove_column :friendships, :requestor_id
  end
end
