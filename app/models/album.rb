class Album < ActiveRecord::Base
  belongs_to :user
  has_many :photos
  has_many :comments
  has_many :a_comments

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/


  validates :title, :presence => true, :length => { :maximum => 140 }
  validates :user_id, :presence => true

  default_scope { order('created_at DESC') }
  scope :from_users_followed_by, lambda { |user| followed_by(user) }




private
    def self.followed_by(user)
      following_ids = %(SELECT followed_id FROM relationships
                        WHERE follower_id = :user_id)
      where("user_id IN (#{following_ids}) OR user_id = :user_id",
            :user_id => user)
    end

    def avatar_url
      avatar_url  = avatar.url
    end

    def as_json(options)
      super(:only => [:title, :text, :avatar_url, :updated_at], :methods => :avatar_url )
    end
end
