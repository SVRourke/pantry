class List < ActiveRecord::Base
    has_many :items
    has_many :contributions
    has_many :users, through: :contributions
    
    def self.create_as_admin(user_id, list_name, list_desc)
        @list = List.create(:title => list_name, :description => list_desc)
        @contrib = Contribution.create(:user => User.find_by_id(user_id), :list => @list, :role => "admin" )
    end

    def add_contributor(contributor_id)
        @contrib = Contribution.create(:user => User.find_by_id(contributor_id), :list => self)
    end
end
