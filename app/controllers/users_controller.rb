class Chitter < Sinatra::Base

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(user_params)
    session[:user_id] = user.id
    redirect '/'
  end

  private

  def user_params
    {  name: params[:name], email: params[:email], username: params[:username],
       password: params[:password], password_confirmation: params[:password_confirmation] }
  end
end
