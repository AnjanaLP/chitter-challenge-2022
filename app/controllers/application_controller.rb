require './app/helpers'

class Chitter < Sinatra::Base
  set :root, File.dirname(File.expand_path('..', __FILE__))
  enable :sessions
  configure :development do
    register Sinatra::Reloader
  end

  helpers Helpers

  get '/' do
    erb :index
  end

  run! if app_file == $0
end
