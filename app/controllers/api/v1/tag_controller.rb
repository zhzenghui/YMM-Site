class Api::V1::TagController < ApplicationController
  skip_before_filter :verify_authenticity_token

    require 'redis-namespace'

    respond_to :json
    WillPaginate.per_page = 20


  

    #get ones tag
    def tag_for_keyworld

        keyworld = params[:keyworld]
        # 流行 数据来源来自mysql
        #  redis  将存储数据
        #  数据 包含  post 和 post 喜欢的人 
        @tags = Tag.where( "name LIKE ? ", "%#{keyworld}%" ).paginate(:page => params[:page])
        render :status => 200,
                        :json => { :status => 1,
                                         :info => "",
                                         :data => @tags
                                        }

    end 

 
  def tag_hot
    key = "taghot"
    $redis.set(key, "稿稿")
    taghot = $redis.get(key)
  

    render :status => 200,
                    :json => { :status => 1,
                                     :info => "",
                                     :data => taghot
                                    }

  end
    #最流行
    def populer

        # 流行 数据来源来自mysql
        #  redis  将存储数据
        #  数据 包含  post 和 post 喜欢的人 
        @onlines = Online.where( "order_num >= 10000 AND state  = 1"  ).paginate(:page => params[:page])
        render :status => 200,
                        :json => { :status => 1,
                                         :info => "",
                                         :data => @onlines
                                        }

    end 
  

    #最新的 
    def new_online

        # 流行 数据来源来自mysql
        #  redis  将存储数据
        #  数据 包含  post 和 post 喜欢的人 
        @onlines = Online.where( "state  = 1 " ).paginate(:page => params[:page]).order( created_at: :desc)
        render :status => 200,
                        :json => { :status => 1,
                                         :info => "",
                                         :data => @onlines
                                        }

    end 
  


    #我的喜欢的
    def like_online
      current_user=User.find_by_authentication_token(online_params[:auth_token])
      object_id=online_params[:object_id]

      @like = Like.new 
      like.user_id = current_user.id
      like.object_id  = object_id
      like.type = 1 # 1 online 2 onlinedetail 3 用户 



      render :status => 200,
                :json => { :status => 1,
                                 :info => "",
                                 :data => @onlines
                                }
    end



    #我的发起
    def my_list

        # 流行 数据来源来自mysql
        #  redis  将存储数据
        #  数据 包含  post 和 post 喜欢的人 

        current_user=User.find_by_authentication_token(online_params[:auth_token])



        @onlines = Online.where(user_id: current_user.user_id, state: 1 ).paginate(:page => params[:page])
        render :status => 200,
                        :json => { :status => 1,
                                         :info => "",
                                         :data => @onlines
                                        }
    end 

    def create 


      online = Online.new()

      current_user=User.find_by_authentication_token(online_params[:auth_token])
      online.user = current_user.to_json
      # online.user_id = current_user.id
      online.relation_url = ""
      online.user_count = 0
      online.image_count = 0
      online.zan_count = 0
      online.zan_user = ""
      online.end_day = ""
      online.essence = ""
      online.state=1 #  1 正常 2  删除
      online.title = online_params[:title]
      online.price = online_params[:price]


      online.description = online_params[:description]
      online.cover_url = online_params[:cover_url]
      online.free = online_params[:free]
      online.zip_conver_url = online_params[:zip_conver_url]
      online.video_url = online_params[:video_url]
      online.type = online_params[:type]  # 图片 视频 链接 
      online.order_num = 0
      result = online.save

      
      if result
        msg = "创建活动成功"
        data = online  
        status = 1
      else
        msg = "创建活动失败"
        data = nil  
        status = 0
      end
      
      render :status => 200,
                          :json => { 
                            :status => status,
                            :msg => msg,
                            :data => online
                          }

    end


    def del_online
      current_user=User.find_by_authentication_token(online_params[:auth_token])

    end

    def create_detail


      onlineDetail = OnlineDetail.new()

      current_user=User.find_by_authentication_token(online_params[:auth_token])
      onlineDetail.media_url = params[:media_url]
      onlineDetail.frames = ""
      onlineDetail.priview = ""
      onlineDetail.auth = ""
      onlineDetail.share_count = ""
      onlineDetail.online_id = ""
      online.price = online_params[:price]
      online.upyun_noti = online_params[:upyun_noti]

      onlineDetail.user_id = current_user.id
      onlineDetail.relation_url = ""
      onlineDetail.user_count = 0
      onlineDetail.image_count = 0
      onlineDetail.zan_count = 0
      onlineDetail.zan_user = ""
      onlineDetail.state=1 #  1 正常 2  删除
      onlineDetail.title = online_params[:title]

      onlineDetail.description = online_params[:description]
      # onlineDetail.cover_url = online_params[:cover_url]
      onlineDetail.free = online_params[:free]
      onlineDetail.zip_conver_url = online_params[:zip_conver_url]
      onlineDetail.video_url = online_params[:video_url]
      onlineDetail.type = online_params[:type]
      online.order = 0

      result = onlineDetail.save

      
      if result
        msg = "创建活动成功"
        data = online  
        status = 1
      else
        msg = "创建活动失败"
        data = nil  
        status = 0
      end
      
      render :status => 200,
                          :json => { 
                            :status => status,
                            :msg => msg,
                            :data => online
                          }

    end


    def online_detail

        # 流行 数据来源来自mysql
        #  redis  将存储数据
        #  数据 包含  post 和 post 喜欢的人 
        @onlineDetail = OnlineDetail.where( "order_num >= 0 AND state  = 1"  ).paginate(:page => params[:page])
        render :status => 200,
               :json => { :status => 1,
                          :info => "",
                          :data => @onlineDetail
                        }

    end 



    def comments
        online_id = params[:id];

        if online_id == ""
            render :status => 200,
                        :json => { :status => 0,
                                         :msg => "活动id为空",
                                         :data => @onlines
                                        }
        end 
        online = Online.published.find_by_id(online_id)

        if !online 
            render :status => 200,
                            :json => { :status => 0,
                                             :msg => "没有找到该活动",
                                             :data => nil
                                            }
        
        end
        
        online_comment = online.online_details.paginate(:page => params[:page], per_page: 30)
        render :status => 200,
                            :json => { :status => 1,
                                             :msg => "活动 参与者",
                                             :data => online_comment
                                            }


   
    end 
private

    # Never trust parameters from the scary internet, only allow the white list through.
    def online_params
      params.require(:online).permit(:title, :description, :price, :cover_url, :free, :auth_token, 
        :zip_conver_url, :video_url, :type, :object_id )
    end
    



end