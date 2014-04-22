class HomeController < ApplicationController
  def index 
    logger.info(current_user)
    logger.info("&&&&&&&&&&&&&&&(((((((((((())))))))))))))))))))))))))))&&&&&&&&&&&&&&&&&&&&&")
        logger.info("&&&&&&&&&&&&&&&(((((((((((())))))))))))))))))))))))))))&&&&&&&&&&&&&&&&&&&&&")

     
  end

  def create 

	   logger.info("&&&&&&&&&&&&&&&(((((((((((())))))))))))))))))))))))))))&&&&&&&&&&&&&&&&&&&&&")
  	logger.info(current_user)
  	logger.info("&&&&&&&&&&&&&&&(((((((((((())))))))))))))))))))))))))))&&&&&&&&&&&&&&&&&&&&&")
  	

  	current_user.avatar = params[:avatar]
  	current_user.save

  	render 'avatar'
  end


  def avatar

    @user = current_user



    
  end

end
