class Album < ActiveRecord::Base
  belongs_to :user
  has_many :photos

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/


  def avatar_url
    avatar_url  = avatar.url
  end

  def as_json(options)
    super(:only => [:title, :text, :avatar_url, :updated_at], :methods => :avatar_url )
  end
end
