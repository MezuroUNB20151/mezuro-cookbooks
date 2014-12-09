# License: GPL v3
# Author: @thiagovsk (2014)
# Mezuro installation recipes.

#list of folders
repo_folder = "/opt/mezuro"
prezento_folder = "/opt/mezuro/prezento"
kalibro_gatekeeper_folder = "/opt/mezuro/kalibro_gatekeeper"
kalibro_processor_folder = "/opt/mezuro/kalibro_processor"

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

# git package
package "git" do
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



## Prezento
#prezento moving database files .sample
file "#{repo_folder}/prezento/config/database.yml" do
	owner 'root'
	group 'root'
	mode 0755
	content ::File.open("#{repo_folder}/prezento/config/database.yml.sample").read
	action :create
end

#prezento moving database files .sample
file "#{repo_folder}/prezento/config/kalibro_gatekeeper.yml" do
	owner 'root'
	group 'root'
	mode 0755
	content ::File.open("#{repo_folder}/prezento/config/kalibro_gatekeeper.yml.sample").read
	action :create
end

#prezento moving database files .sample
file "#{repo_folder}/prezento/config/kalibro_processor.yml" do
	owner 'root'
	group 'root'
	mode 0755
	content ::File.open("#{repo_folder}/prezento/config/kalibro_processor.yml.sample").read
	action :create
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

#kalibro processor moving database files .sample
file "#{repo_folder}/kalibro_processor/config/database.yml" do
	owner 'root'
	group 'root'
	mode 0755
	content ::File.open("#{repo_folder}/kalibro_processor/config/database.yml.sample").read
	action :create
end

#kalibro processor moving database files .sample
file "#{repo_folder}/kalibro_processor/config/repositories.yml" do
	owner 'root'
	group 'root'
	mode 0755
	content ::File.open("#{repo_folder}/kalibro_processor/config/repositories.yml.sample").read
	action :create
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

#kalibro gatekeeper moving database files .sample
file "#{repo_folder}/kalibro_gatekeeper/config/database.yml" do
	owner 'root'
	group 'root'
	mode 0755
	content ::File.open("#{repo_folder}/kalibro_gatekeeper/config/database.yml.sample").read
	action :create
end

#kalibro gatekeeper moving kalibro processor files .sample
file "#{repo_folder}/kalibro_gatekeeper/config/kalibro_processor.yml" do
	owner 'root'
	group 'root'
	mode 0755
	content ::File.open("#{repo_folder}/kalibro_gatekeeper/config/kalibro_processor.yml.sample").read
	action :create
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
