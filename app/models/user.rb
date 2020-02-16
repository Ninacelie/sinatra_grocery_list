class User < ActiveRecord::Base

    has_secure_password #macro allows us to use an activerecord method called authenticate, bcrypt takes a password as plain string and checks it against encrypt to make sure correct password 
    validates :name, presence: true 
    validates :email, presence: true
    validates :email, uniqueness: true 
    
    has_many :grocery_lists
    
end 