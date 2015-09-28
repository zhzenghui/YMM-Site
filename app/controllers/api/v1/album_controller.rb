class Api::V1::AlbumController < ApplicationController

	skip_before_filter :verify_authenticity_token
	# ,
	# 									 :if => Proc.new { |c| c.request.format == 'application/json' }
	respond_to :json
	WillPaginate.per_page = 10



	def index


		current_user=User.find_by_authentication_token(params[:auth_token])
		@albums =  current_user.albums.paginate(:page => params[:page])
	
		render :status => 200,
				 :json => { :status => true,
										 :info => "",
										 :data => @albums}
	end

	def info
		user=User.find_by_authentication_token(params[:auth_token])
		if user
			@posts =  user.posts.paginate(:page => params[:page]).order('created_at DESC')
			render :status => :200,
			:json => { :status => true,
							 :info => user,
							 :data => @posts }
		else 
			render :status => :200,
			:json => { :status => false,
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

end