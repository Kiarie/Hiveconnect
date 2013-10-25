class Hive < ActiveRecord::Base
attr_accessible :password, :password_confirmation
before_save { |user| user.email = email.downcase}
validates :name, presence: true, length: { maximum: 50}
VALID_EMAIL = /\A[\w+-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates :email, presence: true, format: { with: VALID_EMAIL}, uniqueness: {case_sensitive: false} 
validates :password, presence: true, length: { minimum: 6}
validates :password_confirmation, presence: true
end
