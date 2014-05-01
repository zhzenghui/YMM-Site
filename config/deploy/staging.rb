# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary server in each group
# is considered to be the first unless any hosts have the primary
# property set.  Don't declare `role :all`, it's a meta role.



set :application, "ymm"


set :user, 'root'

role :app, %w{root@115.28.188.236}
role :web, %w{root@115.28.188.236}
role :db,  %w{root@115.28.188.236}




# rvm 
set :rvm_ruby_version, 'ruby-2.0.0-p353'
set :rvm_type, :user                     # Defaults to: :auto
set :rvm_custom_path, '/usr/local/rvm/'  # only needed if not detected





server 'root@115.28.188.236', roles: [:web, :app] 

set :deploy_to, '/home/www/'


set :rails_env, :developer


