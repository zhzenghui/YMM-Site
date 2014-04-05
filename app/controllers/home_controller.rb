class HomeController < ApplicationController
  def index 
    
    
     
  end

  def create 

	logger.info("&&&&&&&&&&&&&&&(((((((((((())))))))))))))))))))))))))))&&&&&&&&&&&&&&&&&&&&&")
	logger.info("save   info ")
  	logger.info(current_user)
  	logger.info("&&&&&&&&&&&&&&&(((((((((((())))))))))))))))))))))))))))&&&&&&&&&&&&&&&&&&&&&")
  	

  	current_user.avatar = params[:avatar]
  	current_user.save

  	render 'avatar'
  end


  def avatar


  end

end
