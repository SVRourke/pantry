class Friendship < ActiveRecord::Base
    belongs_to :user
    belongs_to :friend, :class_name => "User"
    
    def self.create_from_ids(user_id, friend_id)
        user_friendship = Friendship.create(user_id: user_id, friend_id: friend_id)
        friend_friendship = Friendship.create(user_id: friend_id, friend_id: user_id)
        [user_friendship, friend_friendship]
    end
    
    def self.destroy_from_ids(user_id, friend_id)
        friendship1 = Friendship.find_by(user_id: user_id, friend_id: friend_id)
        friendship2 = Friendship.find_by(user_id: friend_id, friend_id: user_id)
        friendship1.destroy
        friendship2.destroy
    end
end