class Review < ActiveRecord::Base
    belongs_to :user
    belongs_to :park

    validates :title, :content, presence: true
    validates :content, length: {minimum: 3}
end