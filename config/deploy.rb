require "rvm/capistrano"
require "bundler/capistrano"
require 'capistrano_colors'
load 'deploy/assets'
set :rvm_type, :system
set :application, "clinics"
set :repository, "/var/repos/store_app.git"
set :local_repository,
"ssh://root@192.168.0.100/var/repos/store_app.git"
set :branch, "master"
set :user, "root"
set :deploy_via, :remote_cache
set :keep_releases, 3
set :scm, :git
set :use_sudo, false
set :deploy_to, "/var/www/#{application}/production"
set :rails_env, "production"
set :branch, "master"
role :web, "192.168.0.100"
role :app, "192.168.0.100"
role :db, "192.168.0.100", :primary => true

namespace :deploy do
	namespace :custom_symlinks do
		task :custom_configs do
			run "ln -nsf #{shared_path}/config/database.yml #{current_release}/config/"
		end
		task :user_files do
			run "ln -nsf #{shared_path}/public/uploads/ #{current_release}/public/"
		end
		task :default do
			user_files
			custom_configs
		end
	end
	task :start do ; end
	task :stop do ; end
	task :restart, :roles => :app,
	:except => { :no_release => true } do
			run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
	end
end

namespace :migrate do
	task :default do
		run "cd #{current_release} bundle exec rake db:migrate"
	end
end
before "deploy:assets:precompile", "deploy:custom_symlinks"
after "deploy:update", "deploy:cleanup"