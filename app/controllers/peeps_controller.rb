class Chitter < Sinatra::Base

  get '/peeps/new' do
    erb :'peeps/new'
  end

  get '/peeps' do
    erb :'peeps/index', locals: { peeps: Peep.all_in_reverse_order }
  end

  post '/peeps' do
    if current_user
      Peep.create(content: params[:content], user: current_user)
      redirect '/peeps'
    else
      flash.next[:error] = ["Please log in to continue"]
      redirect '/sessions/new'
    end
  end
end
