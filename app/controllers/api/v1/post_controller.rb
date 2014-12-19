
class Api::V1::PostController < ApplicationController

	require 'redis-namespace'

	skip_before_filter :verify_authenticity_token,
										 :if => Proc.new { |c| c.request.format == 'application/json' }
	respond_to :json
	WillPaginate.per_page = 20


	def like(likeable)
		return false if likeable.blank?
		return false if likeable.like_by_user?(self)
		likeable.push(liked_user_ids: self.id)
		likeable.inc (likes_count: 1)
		likeable.touch
	end 
	def unlike(likeable)
		return false if likeable.blank?
		return false if likeable.like_by_user?(self)
		likeable.pull(liked_user_ids: self.id)
		likeable.inc (likes_count: -1)
		likeable.touch
	end

	def populer

		# 流行 数据来源来自mysql
		#  redis  将存储数据
		#  数据 包含  post 和 post 喜欢的人 
		@posts = Post.paginate(:page => params[:page])
		render :status => :unprocessable_entity,
						:json => { :success => 200,
										 :info => "",
										 :data => @posts
										}

	end 

	def index
		@posts =  current_user.posts.paginate(:page => params[:page])
	
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
							 :info => user,
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