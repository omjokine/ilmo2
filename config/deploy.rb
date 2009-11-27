#
# Requires gem "capistrano"
#
# Init Capfile with "capify" -command, then replace config/deploy.rb with this
#
#
# Usage
#
# First run: cap deploy:setup
#   This generates directory structure
#
# Then: cap deploy  !
#
# see cap -T for tasks


# Copy settings
set :use_sudo, false
set :deploy_via, :copy
set :copy_strategy, :export
set :copy_compression, :gzip

# tunnel connection via public gateway
# note: ssh-key is your LOCAL key, not the one at gateway server
set :gateway, "melkinpaasi.cs.helsinki.fi"

# needs to be set when rake is not in standard location
set :rake, "/opt/ruby-enterprise-1.8.7-2009.10/bin/rake"

# Server settings

set :application, "ilmo2"

set :repository,  "git@git.mpa.fi:railskurssi-mallivastaus.git"
set :scm, "git"

# deploy to ilmo2, but link: /home/paksula/rails -> /home/paksula/ilmo2/current
# ln -s ilmo2/current rails
set :deploy_to, "/home/paksula/ilmo2"
set :user, "paksula"


role :app, "rails.cs.helsinki.fi", :primary => true
role :db, "rails.cs.helsinki.fi", :primary => true


namespace :deploy do
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
end


after "deploy:symlink", "deploy:migrate"


namespace :app do
  desc "Run sample data on production"
  task :sample do
    run "export RAILS_ENV=production ; cd #{current_path} ; #{rake} db:seed courses=#{ENV['courses']}"
  end

  desc "show latest lines from production.log"
  task :log do
    run "tail -n 100 #{current_path}/log/production.log"
  end
end