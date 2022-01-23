class Chitter < Sinatra::Base

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      flash.next[:notice] = ["Successfully logged in"]
      redirect '/'
    else
      flash.now[:error] = ["Incorrect email/password"]
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session.delete(:user_id)
    flash.next[:notice] = ["Successfully logged out"]
    redirect '/'
  end
end
