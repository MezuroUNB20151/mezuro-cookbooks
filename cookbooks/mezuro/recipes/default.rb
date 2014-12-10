# License: GPL v3
# Author: @thiagovsk (2014)
# Mezuro installation recipes.

#LIST OF FOLDERS
repo_folder = "/opt/mezuro"
prezento_folder = "/opt/mezuro/prezento"
kalibro_gatekeeper_folder = "/opt/mezuro/kalibro_gatekeeper"
kalibro_processor_folder = "/opt/mezuro/kalibro_processor"


## FOLDERS
directory "#{repo_folder}" do
	action :create
end

directory "#{prezento_folder}" do
	action :create
end

directory "#{kalibro_processor_folder}" do
	action :create
end

directory "#{kalibro_gatekeeper_folder}" do
	action :create
end

## PACKAGES
# git package
package "git" do
	action :install
end

# tomcat package
package "tomcat6" do
	action :install
end

# tmux is a terminal multiplexer
package "tmux" do
	action :install
end

# Text editor
package "vim" do
	action :install
end

#curl package
package "curl" do
	action :install
end

#build-essential package
package "build-essential" do
	action :install
end

#postgresql-server-dev-9.3 package
package "postgresql-server-dev-9.3" do
	action :install
end

#sqlite3 package
package "sqlite3" do
	action :install
end

#nodejs package
package "nodejs" do
	action :install
end

## SERVICES
#tomcat service
service "tomcat6" do
  action :start
end
#postgresql service
service "postgresql" do
  action :start
end


#prezento repository
git "#{prezento_folder}" do
	repository "https://github.com/mezuro/prezento.git"
	revision "dev"
	action :sync
end

#kalibro gatekeeper repository
git "#{kalibro_gatekeeper_folder}" do
	repository "https://github.com/mezuro/kalibro_gatekeeper.git"
  revision "master"
  action :sync
end

#kalibro processor repository
git "#{kalibro_processor_folder}" do
	repository "https://github.com/mezuro/kalibro_processor.git"
  revision "master"
  action :sync
end

## Prezento files
ruby_block "Prezento Files" do
  block do
    ::FileUtils.copy("#{repo_folder}/prezento/config/database.yml.sample", "#{repo_folder}/prezento/config/database.yml") unless ::File.exists? "#{repo_folder}/prezento/config/database.yml.sample" 
 		::FileUtils.copy("#{repo_folder}/prezento/config/kalibro_gatekeeper.yml.sample", "#{repo_folder}/prezento/config/kalibro_gatekeeper.yml") unless ::File.exists? "#{repo_folder}/prezento/config/kalibro_gatekeeper.yml.sample" 
 		::FileUtils.copy("#{repo_folder}/prezento/config/kalibro_processor.yml.sample", "#{repo_folder}/prezento/config/kalibro_processor.yml") unless ::File.exists? "#{repo_folder}/prezento/config/kalibro_processor.yml.sample"  
  end
end

#execute bundle install for install all gems
#execute "bundle-install" do
#	cwd "#{repo_folder}/prezento"
#	command "bundle install"
#	action :run
#end

#execute  rake db:create for create the databases
#execute "rake db:create" do
#	cwd "#{repo_folder}/prezento"
#	command "bundle exec rake db:create"
#	action :run
#end

#execute  rake db:stup for create tables(rake db:migrate) and run seeds.rb
#execute "rake db:setup" do
#	cwd "#{repo_folder}/prezento"
#	command "bundle exec rake db:setup"
#	action :run
#end

## Kalibro Processor


## Prezento files
ruby_block "kalibro_processor Files" do
  block do
    ::FileUtils.copy("#{repo_folder}/kalibro_processor/config/database.yml.sample", "#{repo_folder}/kalibro_processor/config/database.yml") unless ::File.exists? "#{repo_folder}/kalibro_processor/config/database.yml.sample" 
    ::FileUtils.copy("#{repo_folder}/kalibro_processor/config/repositories.sample", "#{repo_folder}/kalibro_processor/config/repositories.yml") unless ::File.exists? "#{repo_folder}/kalibro_processor/config/database.yml.sample" 
  end
end

#execute bundle install for install all gems
#execute "bundle-install" do
#	cwd "#{repo_folder}/kalibro_processor"
#	command "bundle install"
#	action :run
#end

#execute  rake db:create for create the databases
#execute "rake db:create" do
#	cwd "#{repo_folder}/kalibro_processor"
#	command "bundle exec rake db:create"
#	action :run
#end

#execute  rake db:stup for create tables(rake db:migrate) and run seeds.rb
#execute "rake db:setup" do
#	cwd "#{repo_folder}/kalibro_processor"
#	command "bundle exec rake db:setup"
#	action :run
#end

## Kalibro Gatekeeper
ruby_block "kalibro_processor Files" do
  block do
    ::FileUtils.copy("#{repo_folder}/kalibro_gatekeeper/config/database.yml.sample", "#{repo_folder}/kalibro_gatekeeper/config/database.yml") unless ::File.exists? "#{repo_folder}/gatekeeper/config/database.yml.sample" 
    ::FileUtils.copy("#{repo_folder}/kalibro_gatekeeper/config/kalibro_processor.yml.sample", "#{repo_folder}/kalibro_gatekeeper/config/kalibro_processor.yml") unless ::File.exists? "#{repo_folder}/gatekeeper/config/kalibro_processor.yml.sample" 
  end
end

#execute bundle install for install all gems
#execute "bundle-install" do
#	cwd "#{repo_folder}/kalibro_gatekeeper"
#	command "bundle install"
#	action :run
#end

#execute  rake db:create for create the databases
#execute "rake db:create" do
#	cwd "#{repo_folder}/kalibro_gatekeeper"
#	command "bundle exec rake db:create"
#	action :run
#end

#execute  rake db:stup for create tables(rake db:migrate) and run seeds.rb
#execute "rake db:setup" do
#	cwd "#{repo_folder}/kalibro_gatekeeper"
#	command "bundle exec rake db:setup"
#	action :run
#end


# Kalibro web service
#bash "Kalibro web service" do
#  code <<-EOH
#  git clone https://gist.github.com/0c4ad3b5700c6364abf1.git
#  cd 0c4ad3b5700c6364abf1
#  chmod +x install.sh
#  ./install.sh
#  EOH
#end