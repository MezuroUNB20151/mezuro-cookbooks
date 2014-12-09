# License: GPL v3
# Author: @thiagovsk (2014)
# Mezuro installation recipes.

#list of folders
repo_folder = "/opt/mezuro"


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


## Prezento

#prezento repository
git "#{repo_folder}" do
	repository "https://github.com/mezuro/prezento.git"
	checkout_branch "dev"
	action :sync
end

#prezento moving database files .sample
file "#{repo_folder}/prezento/config/database.yml.sample" do
	owner 'root'
	group 'root'
	mode 0755
	content ::File.open("#{repo_folder}/prezento/config/database.yml").read
	action :create
end

#prezento moving database files .sample
file "#{repo_folder}/prezento/config/kalibro_gatekeeper.yml.sample" do
	owner 'root'
	group 'root'
	mode 0755
	content ::File.open("#{repo_folder}/prezento/config/kalibro_gatekeeper.yml").read
	action :create
end

#prezento moving database files .sample
file "#{repo_folder}/prezento/config/kalibro_processor.yml.sample" do
	owner 'root'
	group 'root'
	mode 0755
	content ::File.open("#{repo_folder}/prezento/config/kalibro_processor.yml").read
	action :create
end

#execute bundle install for install all gems
execute "bundle-install" do
	cwd "#{repo_folder}/prezento"
	command "bundle install"
	action :run
end

#execute  rake db:create for create the databases
execute "rake db:create" do
	cwd "#{repo_folder}/prezento"
	command "bundle exec rake db:create"
	action :run
end

#execute  rake db:stup for create tables(rake db:migrate) and run seeds.rb
execute "rake db:setup" do
	cwd "#{repo_folder}/prezento"
	command "bundle exec rake db:setup"
	action :run
end


## Kalibro Processor

#kalibro processor repository
git "#{repo_folder}" do
	repository "https://github.com/mezuro/kalibro_processor.git"
	checkout_branch "dev"
	action :sync
end

#kalibro processor moving database files .sample
file "#{repo_folder}/kalibro_processor/config/database.yml.sample" do
	owner 'root'
	group 'root'
	mode 0755
	content ::File.open("#{repo_folder}/kalibro_processor/config/database.yml").read
	action :create
end

#kalibro processor moving repository files .sample
file "#{repo_folder}/kalibro_processor/config/repositories.yml.sample" do
	owner 'root'
	group 'root'
	mode 0755
	content ::File.open("#{repo_folder}/kalibro_processor/config/repositories.yml.sample").read
	action :create
end

#execute bundle install for install all gems
execute "bundle-install" do
	cwd "#{repo_folder}/kalibro_processor"
	command "bundle install"
	action :run
end

#execute  rake db:create for create the databases
execute "rake db:create" do
	cwd "#{repo_folder}/kalibro_processor"
	command "bundle exec rake db:create"
	action :run
end

#execute  rake db:stup for create tables(rake db:migrate) and run seeds.rb
execute "rake db:setup" do
	cwd "#{repo_folder}/kalibro_processor"
	command "bundle exec rake db:setup"
	action :run
end

## Kalibro Gatekeeper

#kalibro gatekeeper repository
git "#{repo_folder}" do
	repository "git clone https://github.com/mezuro/kalibro_gatekeeper.git"
	checkout_branch "dev"
	action :sync
end

#kalibro gatekeeper moving database files .sample
file "#{repo_folder}/kalibro_gatekeeper/config/database.yml.sample" do
	owner 'root'
	group 'root'
	mode 0755
	content ::File.open("#{repo_folder}/kalibro_gatekeeper/config/database.yml").read
	action :create
end

#kalibro gatekeeper moving kalibro processor files .sample
file "#{repo_folder}/kalibro_gatekeeper/config/kalibro_processor.yml.sample" do
	owner 'root'
	group 'root'
	mode 0755
	content ::File.open("#{repo_folder}/kalibro_gatekeeper/config/kalibro_processor.yml").read
	action :create
end

#execute bundle install for install all gems
execute "bundle-install" do
	cwd "#{repo_folder}/kalibro_gatekeeper"
	command "bundle install"
	action :run
end

#execute  rake db:create for create the databases
execute "rake db:create" do
	cwd "#{repo_folder}/kalibro_gatekeeper"
	command "bundle exec rake db:create"
	action :run
end

#execute  rake db:stup for create tables(rake db:migrate) and run seeds.rb
execute "rake db:setup" do
	cwd "#{repo_folder}/kalibro_gatekeeper"
	command "bundle exec rake db:setup"
	action :run
end
