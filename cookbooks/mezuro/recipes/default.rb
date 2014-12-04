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

#prezento repository
git "#{repo_folder}" do
	repository "https://github.com/mezuro/prezento.git"
	checkout_branch "dev"
	action :sync
end

#kalibro processor repository
git "#{repo_folder}" do
	repository "https://github.com/mezuro/kalibro_processor.git"
	checkout_branch "dev"
	action :sync
end

#kalibro gatekeeper repository
git "#{repo_folder}" do
	repository "git clone https://github.com/mezuro/kalibro_gatekeeper.git"
	checkout_branch "dev"
	action :sync
end
