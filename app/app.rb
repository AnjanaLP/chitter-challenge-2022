require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'sinatra/flash'
require 'sinatra/partial'

require_relative 'controllers/application_controller'
require_relative 'controllers/home_controller'
require_relative 'controllers/peeps_controller'
require_relative 'controllers/sessions_controller'
require_relative 'controllers/users_controller'

require_relative 'models/user'
require_relative 'models/peep'
