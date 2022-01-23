require './app/helpers'

class Chitter < Sinatra::Base
  set :root, File.dirname(File.expand_path('..', __FILE__))
  enable :sessions,:method_override
  configure :development do
    register Sinatra::Reloader
  end
  register Sinatra::Flash

  helpers Helpers

  run! if app_file == $0
end
