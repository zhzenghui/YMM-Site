class HomeController < ApplicationController
  
  # caches_page :about



  
  def index 
    logger.info(current_user)


    if current_user
      @feed_items = current_user.feed.paginate(:page => params[:page])
      @followers = current_user.followers.paginate(page: params[:page])
      @following = current_user.following.paginate(page: params[:page])
    end

    @posts = Post.all  

  end

  def create 


  	current_user.avatar = params[:avatar]
  	current_user.save

  	render 'avatar'
  end


  def avatar
    @user = current_user

  end

  def about
    
  end

  def about_me
    
  end
  
  def help
  end
  
  
  def contact
  end
end
