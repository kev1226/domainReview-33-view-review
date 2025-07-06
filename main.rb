require 'sinatra'
require 'dotenv/load'

require_relative 'config/database'
require_relative 'app/routes'

set :port, ENV['PORT'] || 3083
set :bind, '0.0.0.0'
