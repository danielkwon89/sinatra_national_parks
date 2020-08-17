class Review < ActiveRecord::Base
    # has an upvote and possibly a downvote (maybe not) attribute. reviews with more upvotes would show higher than reviews with less upvotes.
    # belongs_to :park

    belongs_to :user
    belongs_to :park

    validates :title, :content, presence: true
    validates :content, length: {minimum: 3}
end