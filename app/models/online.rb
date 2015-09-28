class Online < ActiveRecord::Base
  belongs_to :user
  has_many :online_details
  self.inheritance_column = :_type_disabled
  attr_accessor :is_like

  acts_as_taggable # Alias for acts_as_taggable_on :tags
  acts_as_taggable_on :skills, :interests

  scope :published, -> {  where(state: 1) }

  def is_like

   	sql = "type = 1 AND state  = 1  AND object_id  =  #{self.id}  AND user_id  =  #{self.user_id}"
   	like =  Like.where( sql )
   	if like.count == 0
   		self.is_like =  0
   	else
   	 	self.is_like =  1
   	end
  end


  def as_json(options)
    super(:only => [:id, :user_id, :title, :description, :more_details, :cover_url, :user, :current_user_like_state, :relation_url], :methods => :is_like )
  end

end
