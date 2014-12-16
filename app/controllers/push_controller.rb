class PushController < ApplicationController
  def index
  end

  def setup
   @pusher = Grocer.pusher(
      certificate: "#{Rails.root}/config/cert/push_cert.pem",
      passphrase: "",
      gateway: "gateway.sandbox.push.apple.com",
      port: 2195,
      retries: 3
    )

  #    certificate: "#{Rails.root}/config/cert/push_cert.pem",      # required
  # passphrase:  "",                       # optional
  # gateway:     "gateway.sandbox.push.apple.com", # optional; See note below.
  # port:        2195,                     # optional
  # retries:     3     
  end

  def test_push
    setup

    session[:last_device_token] = params[:device_token]
    session[:last_image_url] = params[:image_url]

    n = Grocer::Notification.new(
      device_token: params[:device_token],
      alert: params[:message],
      badge: params[:badge].to_i,
      custom: { image_url: params[:image_url] } 
    )
    @pusher.push(n)

    flash[:notice] = "Sent " + params[:message] + " to " + params[:device_token]

    redirect_to root_url
  end 
end