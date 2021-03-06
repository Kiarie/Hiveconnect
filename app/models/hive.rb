class Hive < ActiveRecord::Base
attr_accessible :name, :email, :password, :password_confirmation
has_secure_password
has_many :microposts, dependent: :destroy
has_many :relationships, foreign_key: 'follower_id', dependent: :destroy
has_many :followed_hives, through: :relationships, source: :followed
has_many :reverse_relationships, foreign_key: 'followed_id', class_name: 'Relationship', dependent: :destroy
has_many :followers, through: :reverse_relationships #source: :follower

before_save { |user| user.email = email.downcase}
before_save :create_token
validates :name, presence: true, length: { maximum: 50}
VALID_EMAIL = /\A[\w+-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates :email, presence: true, format: { with: VALID_EMAIL}, uniqueness: {case_sensitive: false} 
validates :password, presence: true, length: { minimum: 6}
validates :password_confirmation, presence: true
	def feed
	Micropost.from_users_followed_by(self)
	end
	def follow!(other_user)
	self.relationships.create!(followed_id: other_user.id)
	end
	def following?(other_user)
	self.relationships.find_by_followed_id(other_user.id)
	end
	def unfollow!(other_user)
	relationships.find_by_followed_id(other_user.id).destroy
	end
private
	def create_token
	self.remember_token = SecureRandom.urlsafe_base64
	end
	
end
