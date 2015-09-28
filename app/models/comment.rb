class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :online_detail


  scope :published, -> {  where(state: 1) }

end
