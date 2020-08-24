class User < ActiveRecord::Base
    has_many :friendships, dependent: :destroy
    has_many :friends, through: :friendships

    has_many :contributions
    has_many :lists, through: :contributions
    has_many :items, through: :lists

end
