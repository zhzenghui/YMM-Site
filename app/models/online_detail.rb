class OnlineDetail < ActiveRecord::Base
	belongs_to :Online
	has_many :Comments
	self.inheritance_column = :_type_disabled

	scope :published, -> {  where(state: 1) }

	attr_accessor :is_pay


  def is_pay

	 	# sql = "type = 1 AND state  = 1  AND object_id  =  #{self.id}  AND user_id  =  #{self.user_id}"
	 	# like =  Like.where( sql )
	 	# if like.count == 0
	 		# self.is_pay =  0
	 	# else
	 	 	self.is_pay =  1
	 	# end
  end

  def as_json(options)
    super(:only => [:id, 
    								:video_url, 
    								:zan_count, 
    								:user_id, 
    								:updated_at, 
    								:p_id, 
    								:priview, 
    								:type, 
    								:media_url,
    								:online_id,
    								:share_count,
    								:user,
    								:zip_conver_url,
    								:frames,
    								:free,
    								:created_at,
    								:price,
    								:description,
    								], 
    								:methods => :is_pay )
  end
end
