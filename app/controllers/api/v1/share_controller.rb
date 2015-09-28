class Api::V1::ShareController < ApplicationController
	skip_before_filter :verify_authenticity_token

	require 'redis-namespace'

	respond_to :json
	WillPaginate.per_page = 20


	def share_obj		 
		share = ShareList.new()

		type = params[:type]
		user_id = params[:user_id]
		objct_id = params[:objct_id]
		user_name = params[:user_name]

		# type = params[:type]
		share.user_name  = user_name
		share.objct_id   = user_id
		share.objct_type = objct_id
		share.is_zengsong_xingyunbi = ""

		share.save()
	end


end