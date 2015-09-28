class Api::V1::ReceiptsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  require 'venice'

  # 更新服务器纪录
  def validataReceiptUpdateServerData(isDevelopment, receipt)

  end 



  def validataReceipt(isDevelopment, data)

  	client = nil 

    if isDevelopment == "1"
    	client = Venice::Client.development
    else 
    	client = Venice::Client.production
    end
    
  	if receipt = client.verify!(data) #Venice::Receipt.development.verify(data)
    		
    		status = receipt['status'].to_i

    		case status
    		when 0
    			validataReceiptUpdateServerData(isDevelopment, receipt)

    			render :json => {:status => "200", :receipt => receipt}
    		when 1, 21006 
    			render :json => {:status => "21006", :receipt => "验证失败"}
    		when 21007  #验证环境错误
    			logger.info("验证环境错误")
    		  	# validataReceipt(1, data)
    			render :json => {:status => "21007", :receipt => "验证环境错误, 需要使用开发测试环境再次测试"}

    		when 21008 #验证环境错误 
    			render :json => {:status => "21008", :receipt => "验证失败"}
    		else #需要重新验证
    			render :json => {:status => "21008", :receipt => "苹果服务器无响应，验证失败"}
    		end
  	end
  end


  def validate
    data = params[:receipt_data]
    isDevelopment = params[:is_development]
	  validataReceipt(isDevelopment, data)

  end

# 获取当前app的状态
  def  v
  	
    key = params[:info]
    logger.info key

    logger.info $redis
  	logger.info( $redis.get(key))
    render :json => { :info =>  $redis.get(key) }
  end 


end