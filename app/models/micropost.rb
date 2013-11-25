class Micropost < ActiveRecord::Base
attr_accessible :content
validates :hive_id, presence: true
validates :content, presence: true, length: {maximum: 140}
belongs_to :hive

default_scope order: 'microposts.created_at DESC'
 
def self.from_users_followed_by(hive)
	followed_hive_ids = "SELECT followed_id FROM relationships WHERE follower_id = :user_id"
	where("hive_id IN (#{followed_hive_ids}) or hive_id = :user_id", user_id: hive.id)
	end
end
