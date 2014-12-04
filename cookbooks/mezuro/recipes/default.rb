# License: GPL v3
# Author: @thiagovsk (2014)
# Mezuro installation recipes.

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
