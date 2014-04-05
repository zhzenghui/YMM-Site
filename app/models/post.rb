class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  has_many :taggings
  has_many :tags, :through => :taggings

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /image/


  validates :title, :presence => true, length: { minimum: 5 },
  										:uniqueness => true
  validates :text, :presence => true
	
  
  scope :tag_with, lambda{|tag_name| joins(:tags).where("tags.name = ?", tag_name)}
  scope :latter_than, lambda{|time| joins(:taggings).where("taggings.created_at > ?", time)}





end
