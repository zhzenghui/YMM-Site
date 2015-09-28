
class Api::V1::MessageController < ApplicationController

  skip_before_filter :verify_authenticity_token


  respond_to :json

  # # WillPaginate.per_page = 10


  def fm 
    render :status => 200, 
        :json => { :status => 1}
  end 


  def sender 
    sender_user=User.find_by_authentication_token(params[:auth_token])
    # receive_user =User.find_by_name(params[:receive])


    receive=params[:receive]
    title=params[:title]
    content=params[:content]

    userjson =  sender_user.to_json



    message = Message.find_by_sender(sender_user.id)


    logger.info message
    if message.nil? 
      # logger.info "message nil"
      message = Message.new
      message.sender = sender_user.id
      message.receive = receive

    end

    message.sender_userinfo = userjson


     
    message.last_msg = title
    message.status = 1 #  1 未读  2 已读  3  删除
    message.type = 1 #  1 系统 2 兑换  3 消息  4   通知
    message.isDel = 1 # 1 正常  0  删除
    message.updated_at = Time.now

    message.save()

    messageDetail = MessageDetail.new
    messageDetail.message_id =  message.id 
    messageDetail.title = title
    messageDetail.content = content
    messageDetail.sender_status = 1 #  1 未读  2 已读  3  删除
    messageDetail.receive_status = 1 #  1 未读  2 已读  3  删除
    messageDetail.isDel = 1 # 1 正常  0  删除

    messageDetail.save()
    

    render :status => 200,
           :json => {
                      :status => 1,
                      :info => "",
                      :data => ""
                    }
  end


  def find_by_message
    sender_user=User.find_by_authentication_token(params[:auth_token])

    # type =  params[:type]
    # if type = 0
    #   type 
    # end
    @messages = Message.where(receive: sender_user.id, isDel: 1).paginate(:page => params[:page])
    render :status => 200,
                    :json => { :status => 1,
                               :info => "",
                               :data => @messages
                              }

  end

  def find_by_messageDetail

    @messageDetail = MessageDetail.where(message_id: params[:message_id]).paginate(:page => params[:page])
    render :status => 200,
                    :json => { :status => 1,
                               :info => "",
                               :data => @messageDetail
                              }

  end




  def readMessage 
    message = Message.find_by_id(params[:message_id])
    message.status =  2 #  1 未读  2 已读  3  删除
    message.save

    render :status => 200,
                    :json => { :status => 1,
                               :info => "",
                               :data => message
                              }
  end

  def delMessage 
    message = Message.find_by_id(params[:message_id])
    message.isDel =  0 # 1 正常  0  删除
    message.save

    render :status => 200,
                    :json => { :status => 1,
                               :info => "",
                               :data => message
                              }
  end












end