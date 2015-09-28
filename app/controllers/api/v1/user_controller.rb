class Api::V1::UsersController < ApplicationController

	skip_before_filter :verify_authenticity_token
	# ,
	# 									 :if => Proc.new { |c| c.request.format == 'application/json' }
	respond_to :json
	WillPaginate.per_page = 10


	def update_user_info


	end

	def index
		@posts =  current_user.posts.paginate(:page => params[:page])
	
		render :status => :200,
						:json => { :success => true,
										 :info => "",
										 :data => @posts}
	end

	def info
		user=User.find_by_authentication_token(params[:auth_token])
		if user
			@posts =  user.posts.paginate(:page => params[:page]).order('created_at DESC')
			render :status => :200,
			:json => { :success => true,
							 :info => user,
							 :data => @posts }
		else 
			render :status => :200,
			:json => { :success => false,
							 :info =>"上传要求：jpg ",
							 :data => {} }      
		end 
	end

	def upload
		@image = params[:image]
		render :status => :200,
					 :json => { :success => false,
										 :info =>" @task.errors.full_messages",
										 :data => {} }
	end 


	def follow
	end


	def unfollow
	end

end