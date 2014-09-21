class Post < ActiveRecord::Base

  self.per_page = 2

  belongs_to :user
  has_many :comments


  acts_as_taggable # Alias for acts_as_taggable_on :tags
  acts_as_taggable_on :skills, :interests


  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, 
          :default_url => "/images/:style/missing.png", :size => { :in => 0..1800.kilobytes }
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/


  validates :title, :presence => true, length: { minimum: 5 },
  										:uniqueness => true
  validates :text, :presence => true
	
  
  scope :tag_with, lambda{|tag_name| joins(:tags).where("tags.name = ?", tag_name)}
  scope :latter_than, lambda{|time| joins(:taggings).where("taggings.created_at > ?", time)}



  WillPaginate.per_page = 5



  def description_markdown
    avatar_url  = avatar.url
  end

  def as_json(options)
    super(:only => [:title, :text, :avatar_url], :methods => :description_markdown )
  end




end
