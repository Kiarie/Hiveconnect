class Relationship < ActiveRecord::Base
attr_accessible :followed_id

belongs_to :follower, class_name: 'Hive'
belongs_to :followed, class_name: 'Hive'

validates :follower_id, presence: true
validates :followed_id, presence: true
end
