class HomeController < ApplicationController
  def index 
    logger.info(current_user)
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
end
