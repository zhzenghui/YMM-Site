# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary server in each group
# is considered to be the first unless any hosts have the primary
# property set.  Don't declare `role :all`, it's a meta role.



set :application, "shoes"

set :user, 'root'
set :password, 'zenghui!@#123'



server '115.28.188.236', roles: [:web, :app] 

set :deploy_to, '/home/www/staging'


set :enable_ssl, false

set :ssh_options, {
   verbose: :debug
}