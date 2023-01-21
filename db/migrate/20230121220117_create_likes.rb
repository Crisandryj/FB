class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.boolean :liked
      t.integer :likeable_id
      t.string :likeable_type
      t.timestamps
    end
  end
end
