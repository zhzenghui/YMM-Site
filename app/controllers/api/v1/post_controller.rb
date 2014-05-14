
class Api::V1::PostController < ApplicationController

  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  respond_to :json

  WillPaginate.per_page = 10



  def index


    @posts =  current_user.posts.paginate(:page => params[:page])
    
# do |post|
#   json.extract! post, :id, :title, :text, :user_id
#   json.url post_url(post, format: :json)
# end
    render :status => :unprocessable_entity,
            :json => { :success => true,
                     :info => "",
                     :data => @posts}
  end


  
  def info
    

   

    user=User.find_by_authentication_token(params[:auth_token])
   

    if user


      @posts =  user.posts.paginate(:page => params[:page]).order('created_at DESC')


      render :status => :unprocessable_entity,
      :json => { :success => true,
               :info =>"上传要求：jpg ",
               :data => @posts }
    else 
      render :status => :unprocessable_entity,
      :json => { :success => false,
               :info =>"上传要求：jpg ",
               :data => {} }      
    end 
  end

  def upload
    @image = params[:image]


   render :status => :unprocessable_entity,
          :json => { :success => false,
                     :info =>" @task.errors.full_messages",
                     :data => {} }
  end 

end