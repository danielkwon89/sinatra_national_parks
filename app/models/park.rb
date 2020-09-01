class Park < ActiveRecord::Base
    has_many :reviews
    has_many :users, through: :reviews

    def self.by_state(state_name)
        Park.where(location: state_name)
    end
end