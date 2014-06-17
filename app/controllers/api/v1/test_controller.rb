class Api::V1::TestController < ApplicationController
	skip_before_filter :verify_authenticity_token
	respond_to :json
	

	def index
	
		render :status => 200,
						:json => { :success => true,
										 :info => "test",
										 :data => "test"}
	end

	

end