module 
  module APIEntities
  	class User < Api::V1::Entity
  	end


  	class Post < Api::V1::Entity

  		expose :title, :text, :avatar_url

  	end

  end


end