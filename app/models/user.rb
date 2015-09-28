class User < ActiveRecord::Base
  STATE = {
    # 软删除
    :deleted => -1,
    # 正常
    :normal => 1,
    # 屏蔽
    :blocked => 2,
  }



  
  has_many :posts
  has_many :onlines
  has_many :albums
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name:  "Relationship",
                                   dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower


  has_many :relationships, :dependent => :destroy,
                           :foreign_key => "follower_id"
  has_many :following, :through => :relationships, :source => :followed


  # has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  # validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
        

  # def follow!(other_user)
  #   relationships.create!(followed_id: other_user.id)
  # end

  # def unfollow!(other_user)
  #   relationships.find_by(followed_id: other_user.id).destroy
  # end 
  


  def followerss
    followers =  relationships.find_by_followed_id(self.id)
    return followers
  end 
  def following?(followed)
    relationships.find_by_followed_id(followed)
  end

  
  def follow!(followed)
    relationships.create!(:followed_id => followed.id)
  end
  
  def unfollow!(followed)
    relationships.find_by_followed_id(followed).destroy
  end


  def feed
    Album.from_users_followed_by(self)
  end


  def skip_confirmation!
    self.confirmed_at = Time.now
  end       
  
  def get_user_for(token)
  	 
  	 user = User.find_by_authentication_token(token)
  	 if user
  	 	reture true
  	 end
  	 false
  end

  def resetPassword(email)
    u = User.find_by_email('zenghui@gmail.com')
    u.send_reset_password_instructions
  end
   
  def reset_authentication_token!
  	 self.authentication_token = Digest::MD5::hexdigest(Array.new(10){rand(1024).to_s(36)}.join+DateTime.now.to_s())
  	 self.save()
  end 


	def user_params
	  params.require(:user).permit(:avatar, :email, :password)
	end

end
