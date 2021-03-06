require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/rvm'
require 'mina/unicorn'

set :sudo, 'true'
set :rvm_use_path, '/usr/local/rvm/scripts/rvm'
set :domain, '10.233.38.15'
set :user, 'sedhab'

if ENV['SERVER'] == 'B'
  set :user, 'root'
  set :domain, '10.233.38.19'
  invoke :'rvm:use', '2.5.0'
end

if ENV["STAGE"] == "dev"
  set :deploy_to, '/var/www/development/apps/portal'
else
  set :deploy_to, '/var/www/production/apps/portal'
end

set  :repository, 'https://github.com/codhab/codhab_portal.git'
set  :branch, ENV["BRANCH"] ||= 'master'

set :shared_dirs, fetch(:shared_dirs, []).push('log', 'tmp/pids', 'tmp/sockets', 'public', 'brb_file')
set :shared_files, fetch(:shared_files, []).push('config/database.yml', 'config/secrets.yml', 'config/unicorn.rb', 'config/env.yml')


task :setup do
  command %[touch "#{fetch(:shared_path)}/config/database.yml"]
  command %[touch "#{fetch(:shared_path)}/config/secrets.yml"]
  comment "Be sure to edit '#{fetch(:shared_path)}/config/database.yml', 'secrets.yml' and puma.rb."
end

task :environment do
  invoke :'rvm:use', '2.6.0'
end

task :deploy do
  deploy do
    invoke  :'git:clone'
    invoke  :'deploy:link_shared_paths'
    invoke  :'bundle:install'
    # invoke  :'rails:assets_precompile'
    invoke  :'deploy:cleanup'
    on :launch do
      invoke :'unicorn:restart'
    end
  end
end
