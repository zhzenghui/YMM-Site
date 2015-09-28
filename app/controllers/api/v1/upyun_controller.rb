class Api::V1::UpyunController < ApplicationController
	skip_before_filter :verify_authenticity_token
	respond_to :json

	def index
	
		render :status => 200,
						:json => { :success => true,
										 :info => "test",
										 :data => "test"}
	end

	def test
	
		render :status => 200,
						:json => { :success => true,
										 :info => "post test",
										 :data => "post test"}
	end

	def getsp 
    	bucket = "yuefile"
		secret = "3ud4dQlQSvVjWYmnXcgvWMXUJgg="

		signature_no_secret = params[:signature_no_secret]
		signature = signature_no_secret + secret
		signature =  Digest::MD5.hexdigest(signature) 

		render :status => 200,
						:json => { :success => 1,
										 	 :info => signature,
										   :data => signature}
 
 

	end


end