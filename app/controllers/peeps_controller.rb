class Chitter < Sinatra::Base

  get '/peeps/new' do
    erb :'peeps/new'
  end

  get '/peeps' do
    erb :'peeps/index', locals: { peeps: Peep.all }
  end

  post '/peeps' do
    peep = Peep.create(content: params[:content], user: current_user)
    redirect '/peeps'
  end
end
