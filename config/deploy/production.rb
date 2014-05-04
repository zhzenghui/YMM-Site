

set :application, "Yue-Site"
set :stage, :production
set :pty, true


set :user, 'root'

role :app, %w{root@115.28.188.236}
role :web, %w{root@115.28.188.236}
role :db,  %w{root@115.28.188.236}

set :deploy_to, "/home/www/#{fetch(:application)}"



# rvm 
set :rvm_ruby_version, 'ruby-2.1.0'
set :rvm_type, :user                     # Defaults to: :auto
set :rvm_custom_path, '/usr/local/rvm/'  # only needed if not detected




server 'root@115.28.188.236', roles: [:web, :app] 

set :rails_env, :production
set :unicorn_env, :production



set :nginx_server_name, '115.28.188.236'
set :nginx_pid, "/var/run/nginx.pid"



set :unicorn_service, "unicorn_#{fetch(:application)}_#{fetch(:stage)}"
set :unicorn_pid,     "#{fetch(:deploy_to)}/tmp/pids/unicorn.pid")
set :unicorn_config,  "#{fetch(:deploy_to)}/config/unicorn.rb"
set :unicorn_workers, 1



namespace :deploy do

  desc 'Restart NGINX'
  task :restart do
    on roles(:app), in: :sequence, wait: 1 do
       execute :sudo, "./restart.sh"
    end
  end

end





