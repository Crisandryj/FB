class AddColumns < ActiveRecord::Migration[7.0]
  def change
    add_column :friendships, :requestee_id, :integer
    add_column :friendships, :requestor_id, :integer
  end
end
