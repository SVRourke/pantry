class List < ActiveRecord::Base
    has_many :contributions
    has_many :users, through: :lists
    
end
