class Relationship < ActiveRecord::Base
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  validates :follower_id, presence: true
  validates :followed_id, presence: true


  def follower
  	followers =  Relationship.find_by_follower_id(current_user.id)
  	return followers
  end
  
end
