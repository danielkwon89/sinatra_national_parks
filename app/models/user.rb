class User < ActiveRecord::Base
    # has_and_belongs_to_many :parks
    # has_many :reviews, through: :parks

    has_many :reviews
    has_many :parks, through: :reviews

    validates_presence_of :first_name, :last_name, :email, :password_digest
    has_secure_password
end