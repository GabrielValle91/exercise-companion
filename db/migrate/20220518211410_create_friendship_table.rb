class CreateFriendshipTable < ActiveRecord::Migration[7.0]
  def change
    create_table :friendships do |t|
      t.integer :user_id
      t.integer :friend_id
      t.timestamps null: false
    end
  end
end