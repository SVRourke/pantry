class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :friend
      t.boolean :confirmed
      t.timestamps null: false
    end
  end
end
