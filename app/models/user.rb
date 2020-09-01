class User < ActiveRecord::Base
    has_many :reviews
    has_many :parks, through: :reviews

    validates_presence_of :first_name, :last_name, :email, :password_digest
    validates :email, uniqueness: true
    has_secure_password
end