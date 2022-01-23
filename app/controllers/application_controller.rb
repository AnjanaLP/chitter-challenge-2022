require './app/helpers'

class Chitter < Sinatra::Base
  set :root, File.dirname(File.expand_path('..', __FILE__))
  configure :development do
    register Sinatra::Reloader
  end
  register Sinatra::Flash
  register Sinatra::Partial
  set :partial_template_engine, :erb
  enable :sessions, :method_override, :partial_underscores

  helpers Helpers

  run! if app_file == $0
end
