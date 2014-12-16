pusher = Grocer.pusher(
  certificate: "#{Rails.root}/config/cert/push_cert.pem",      # required
  passphrase:  "",                       # optional
  gateway:     "gateway.push.apple.com", # optional; See note below.
  port:        2195,                     # optional
  retries:     3                         # optional
)

pusher_dev = Grocer.pusher(
  certificate: "#{Rails.root}/config/cert/push_cert.pem",      # required
  passphrase:  "",                       # optional
  gateway:     "gateway.sandbox.push.apple.com", # optional; See note below.
  port:        2195,                     # optional
  retries:     3                         # optional
)



def push_notity 
	# `device_token` and either `alert` or `badge` are required.
	#
	# Information on obtaining `device_token` is shown later.
	notification = Grocer::Notification.new(
	  device_token:      "2ba9036a0b45f73110cf53426f85e07f8a9616b72905f5f59c53f0b21cc461b4",
	  alert:             "Hello from Grocer!",
	  badge:             42,
	  category:          "a category",         # optional; used for custom notification actions
	  sound:             "siren.aiff",         # optional
	  expiry:            Time.now + 60*60,     # optional; 0 is default, meaning the message is not stored
	  identifier:        1234,                 # optional; must be an integer
	  content_available: true                  # optional; any truthy value will set 'content-available' to 1
	)

	pusher_dev.push(notification)
end 
