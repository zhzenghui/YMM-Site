class HomeController < ApplicationController
  def index 
    logger.info(current_user)


    if current_user
      @feed_items = current_user.feed.paginate(:page => params[:page])
      @followers = current_user.followers.paginate(page: params[:page])
      @following = current_user.following.paginate(page: params[:page])
    end

  end

  def create 


  	current_user.avatar = params[:avatar]
  	current_user.save

  	render 'avatar'
  end


  def avatar
    @user = current_user
  end

end
