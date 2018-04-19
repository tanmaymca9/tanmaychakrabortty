# Load DSL and set up stages
require "capistrano/setup"
require "capistrano/deploy"
require "capistrano/rails"
require "capistrano/bundler"
require "capistrano/rvm"
require "capistrano/puma"
# require 'capistrano/sidekiq'
require 'capistrano/linked_files'


Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }

require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git
install_plugin Capistrano::Puma