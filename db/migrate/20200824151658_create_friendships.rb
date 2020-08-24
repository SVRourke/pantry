class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :
      t.boolean :confirmed
      t.timestamps
    end
  end
end
