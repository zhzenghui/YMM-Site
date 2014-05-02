

set :application, "ymm"


set :user, 'root'

role :app, %w{root@115.28.188.236}
role :web, %w{root@115.28.188.236}
role :db,  %w{root@115.28.188.236}




# rvm 
set :rvm_ruby_version, 'ruby-2.1.0'
set :rvm_type, :user                     # Defaults to: :auto
set :rvm_custom_path, '/usr/local/rvm/'  # only needed if not detected





server 'root@115.28.188.236', roles: [:web, :app] 

set :rails_env, :production
set :deploy_to, "/home/www/#{fetch(:application)}"



# unicorn.rb 路径
set :unicorn_path, "#{deploy_to}/current/config/unicorn.rb"




